import SwiftUI

struct TabBar<Content: View>: View {
    @EnvironmentObject private var appState: AppState

    @Binding var selectedTab: Page
    private let content: Content

    init(
        selectedTab: Binding<Page>,
        @ViewBuilder _ content: () -> Content
    ) {
        self._selectedTab = selectedTab
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
                .padding(.bottom, 50 - 1)

            VStack {
                Spacer()

                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(height: 0.5)
                            .opacity(0.12)
                        Rectangle()
                            .fill(.white)
                            .ignoresSafeArea()
                            .frame(height: 50 - 1)
                    }

                    HStack(alignment: .bottom) {
                        Spacer()

                        VStack(spacing: 0) {
                            Image("home_gray")
                                .renderingMode(.template)
                                .foregroundStyle(selectedTab == .feed ? Color(hex: 0x2975CC) : Color(hex: 0x99A2AD))
                            Text("Главная")
                                .font(.system(size: 10))
                                .foregroundStyle(selectedTab == .feed ? Color(hex: 0x2975CC) : Color(hex: 0x99A2AD))
                                .padding(.top, 2)
                        }
                        .padding(.top, 4)
                        .frame(width: 75, height: 50)
                        .onTapGesture {
                            selectedTab = .feed
                        }

                        Spacer()

                        ZStack {
                            VStack(spacing: 0) {
                                Image("chats_gray")
                                    .renderingMode(.template)
                                    .foregroundStyle(selectedTab == .chats ? Color(hex: 0x2975CC) : Color(hex: 0x99A2AD))
                                Text("Чаты")
                                    .font(.system(size: 10))
                                    .foregroundStyle(selectedTab == .chats ? Color(hex: 0x2975CC) : Color(hex: 0x99A2AD))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 4)
                            .frame(width: 75, height: 50)
                            .onTapGesture {
                                selectedTab = .chats
                            }

                            if let unreadCountChats = appState.unreadCountChats {
                                CountPin(
                                    pin: .small,
                                    unreadCount: unreadCountChats,
                                    color: Color(hex: 0xFF3347)
                                )
                                .padding(.leading, 25)
                                .padding(.bottom, 25)
                            }
                        }

                        Spacer()
                    }
                }
            }
        }
        .safeAreaPadding(.bottom, UIDevice().hasDynamicIsland ? 20 : 0)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    let appState = AppState()

    appState.unreadCountChats = 3

    return TabBar(selectedTab: .constant(.chats)) {
        Color.blue.ignoresSafeArea()
        Text("test")
    }
    .environmentObject(appState)
}
