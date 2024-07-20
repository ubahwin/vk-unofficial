import SwiftUI

// swiftlint:disable type_body_length file_length line_length
struct ChatsView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.chatsReducer) private var chatsReducer: ChatsReducer

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colors) var colors

    @State private var searchChats = ""

    @State private var hoveringIndex = -1

    @State private var selectedItemIndex: Int?
    @State private var selectedItemOffset: CGFloat?

    @State private var foldersOffset: CGFloat?
    private let foldersHeight: CGFloat = 46

    @State private var buisnessNotificationHovering = false

    #if canImport(UIKit)
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear

        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    #endif

    var body: some View {
        #if os(iOS)
        NavigationStack {
            ScrollView {
                VStack {
                    SearchBar(text: $searchChats)
                        .padding(.horizontal, 8)
                        .padding(.top, 8)

                    ForEach(Array(appState.chats.enumerated()), id: \.offset) { index, chat in
                        NavigationLink {
                            Text(chat.name)
                        } label: {
                            ChatCell(chat: chat)
                        }
                        .buttonStyle(TappedChat())

                        if index == appState.lastPinnedChatIndex {
                            Divider()
                                .background(Color(hex: 0xd7d8d9))
                                .padding(.horizontal, 12)
                        }
                    }
                }
            }
            .refreshable {
                chatsReducer.refreshChats()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 0) {
                        Button {

                        } label: {
                            Image("me")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 24, height: 24)
                        }

                        Text("Чаты")
                            .font(.system(size: 21, weight: .semibold))
                            .padding(.leading, 2)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 0) {
                        Button {

                        } label: {
                            Image("phone_add_outline_28")
                                .renderingMode(.template)
                                .foregroundStyle(colorScheme == .dark ? .white : Color(hex: 0x2688EB))
                        }
                        .padding(.trailing)
                        Button {

                        } label: {
                            Image("write_blue")
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        #endif

        #if os(macOS)
        HSplitView {
                ZStack {
                    Rectangle()
                        .fill(.white)

                    VStack(spacing: 0) {
                        header

                        SearchBar(text: $searchChats)
                            .padding(.horizontal)
                            .padding(.bottom, 6)

                        GeometryReader { geometry in
                            ZStack {
                                ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        buisnessNotification

                                        VStack(spacing: 0) {
                                            folders
                                        }
                                            .background(
                                                GeometryReader { geometry in
                                                    Color.clear
                                                        .preference(
                                                            key: OffsetPreferenceKey.self,
                                                            value: geometry.frame(in: .global).minY
                                                        )
                                                }
                                            )
                                            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                                                foldersOffset = value
                                            }

                                        ForEach(Array(appState.chats.enumerated()), id: \.offset) { index, chat in
                                            Button {
                                                appState.selectedChat = chat

                                                selectedItemIndex = index
                                                selectedItemOffset = nil
                                            } label: {
                                                ZStack {
                                                   Rectangle()
                                                        .fill(
                                                            chat == appState.selectedChat ? colors.selectedColor : .white
                                                        )
                                                    ChatCell(
                                                        chat: chat,
                                                        hovering: hoveringIndex == index
                                                    )
                                                }
                                            }
                                            .buttonStyle(TappedChat())
                                            .onHover {
                                                hoveringIndex = $0 ? index : -1
                                            }
                                            .background(
                                                GeometryReader { geometry in
                                                    Color.clear
                                                        .preference(
                                                            key: OffsetPreferenceKey.self,
                                                            value: geometry.frame(in: .global).minY
                                                        )
                                                }
                                            )
                                            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                                                if index == selectedItemIndex {
                                                    selectedItemOffset = value
                                                }
                                            }

                                            if index == appState.lastPinnedChatIndex {
                                                Spliter(padding: 12)
                                            }
                                        }
                                    }
                                }

                                VStack(spacing: 0) {
                                    if let foldersOffset,
                                       foldersOffset < geometry.frame(in: .global).minY {
                                        folders
                                    }

                                    if let selectedItemIndex,
                                       let selectedItemOffset,
                                       selectedItemOffset < geometry.frame(in: .global).minY + foldersHeight {
                                        ZStack {
                                            VStack(spacing: 0) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .frame(height: 72)

                                                Spliter()
                                            }
                                            .shadow(color: Color(hex: 0xe0e0e0, alpha: 0.2), radius: 5, y: 20)

                                            ChatCell(
                                                chat: appState.chats[selectedItemIndex],
                                                hovering: false
                                            )
                                        }
                                    }

                                    Spacer()
                                }
                            }
                        }

                        footerUnreadChats
                }
            }
            .frame(
                minWidth: 200,
                idealWidth: 300,
                maxWidth: 400,
                minHeight: 300,
                idealHeight: 500,
                maxHeight: .infinity
            )

            ZStack {
                Rectangle()
                    .fill(Color(hex: 0xebedf0))

                if let chat = appState.selectedChat {
                    ConversationView(chat: chat)
                } else {
                    VStack {
                        Image("messages_outline_56")
                            .renderingMode(.template)
                        Text("Выберите чат")
                        Text("или создайте новый")
                    }
                    .foregroundStyle(.gray)
                }
            }
            .frame(
                minWidth: 100,
                idealWidth: 200,
                maxWidth: .infinity,
                minHeight: 300,
                idealHeight: 500,
                maxHeight: .infinity
            )
        }
        .frame(
            minWidth: 300,
            idealWidth: 600,
            maxWidth: .infinity,
            minHeight: 300,
            idealHeight: 500,
            maxHeight: .infinity
        )
        #endif
    }

    struct OffsetPreferenceKey: PreferenceKey {
        typealias Value = CGFloat
        static var defaultValue: CGFloat = 0.0

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value += nextValue()
        }
    }

    struct TappedChat: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                #if os(iOS)
                .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.clear)
                #endif
        }
    }

    private var header: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 54)
            HStack {
                Button {

                } label: {
                    Image("menu_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(colors.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing)

                Text("VK Me")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()

                Button {

                } label: {
                    Image("phone_add_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(colors.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())

                Button {

                } label: {
                    Image("archive_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(colors.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 10)

                Button {

                } label: {
                    Image("write_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(colors.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
        }

    }

    private var footerUnreadChats: some View {
        ZStack {
            VStack(spacing: 0) {
                Spliter()
                Rectangle()
                    .fill(.white)
                    .frame(height: 50)
            }

            HStack {
                Image("message_unread_top_outline_20")
                    .renderingMode(.template)
                    .foregroundStyle(colors.blueText)

                Text("Только непрочитанные")

                Spacer()

                Toggle("", isOn: $appState.onlyUnreadMessages)
                    .toggleStyle(.switch)
            }
            .padding(.horizontal)
        }
    }

    private var buisnessNotification: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 46)

            if buisnessNotificationHovering {
                RoundedRectangle(cornerRadius: 8)
                    .fill(colors.selectedColor)
                    .frame(height: 40)
                    .padding(.horizontal, 6)
            }

            HStack {
                Button {

                } label: {
                    Image(buisnessNotificationHovering ? "cancel_outline_24" : "work_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(colors.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)

                Text("Бизнес-уведомления")
                    .font(.system(size: 14, weight: .medium))

                Spacer()
            }
            .onHover { buisnessNotificationHovering = $0 }
        }
    }

    private var folders: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: foldersHeight)

            HStack {
                Button {

                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .stroke(Color(hex: 0xd7d8d9), lineWidth: 1)
                            .frame(width: 56, height: 28)
                            .shadow(color: Color(hex: 0xd1d1d1), radius: 6)

                        HStack {
                            Text("Все")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(Color(hex: 0x2688EB))

                            Text("4")
                                .font(.system(size: 12, weight: .medium))
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

#Preview {
    let appState = AppState()
    let chatsReducer: ChatsReducer = ._stub
    let colors: ColorConsts = .lightTheme

    appState.lastPinnedChatIndex = 3
    appState.chats = [
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub
    ]

    return ChatsView()
        .environment(\.chatsReducer, chatsReducer)
        .environment(\.colors, colors)
        .environmentObject(appState)
        .preferredColorScheme(.light)
}
// swiftlint:enable type_body_length file_length line_length
