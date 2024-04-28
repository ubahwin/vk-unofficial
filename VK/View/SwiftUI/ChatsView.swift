import SwiftUI

struct ChatsView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.chatsReducer) private var chatsReducer: ChatsReducer

    @Environment(\.colorScheme) var colorScheme

    @State private var searchChats = ""

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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    SearchBar(text: $searchChats)
                        .padding(.horizontal, 8)
                        .padding(.top, 8)

                    ForEach(appState.chats) { chat in
                        NavigationLink {
                            Text(chat.name)
                        } label: {
                            ChatCell(chat: chat)
                        }
                        .buttonStyle(TappedChat())
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
                            Image("mock_image")
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
    }

    struct TappedChat: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.clear)
        }
    }
}

#Preview {
    let appState = AppState()
    let chatsReducer: ChatsReducer = .stub

    appState.chats = [
        .stub,
        .stub,
        .stub,
        .stub,
        .stub,
        .stub,
        .stub
    ]

    return ChatsView()
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
}
