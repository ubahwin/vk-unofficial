import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.chatsReducer) private var chatsReducer: ChatsReducer

    @State private var selectedTab: Page = .chats

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            TabBar(selectedTab: $selectedTab) {
                coordinator.build(page: selectedTab)
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
    let chatsReducer: ChatsReducer = .stub

    return ContentView()
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
        .environmentObject(coordinator)
}
