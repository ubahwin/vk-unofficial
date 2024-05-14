import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.chatsReducer) private var chatsReducer: ChatsReducer

    @State private var selectedTab: Page = .chats

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SwiftUI.Group {
                #if os(iOS)
                TabBar(selectedTab: $selectedTab) {
                    coordinator.build(page: selectedTab)
                }
                #endif

                #if os(macOS)
                ChatsView()
                #endif
            }
            .navigationDestination(for: Page.self) { page in
                coordinator.build(page: page)
            }
        }
        .onAppear {
            chatsReducer.refreshChats()
        }
    }
}

#Preview {
    let appState = AppState()
    let coordinator = Coordinator()
    let chatsReducer: ChatsReducer = ._stub

    return ContentView()
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
        .environmentObject(coordinator)
}
