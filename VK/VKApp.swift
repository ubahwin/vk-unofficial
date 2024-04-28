import SwiftUI

@main
struct VKApp: App {
    private let appState: AppState
    private var chatsReducer: ChatsReducer
    private var coordinator: Coordinator

    init() {
        let appState = AppState()

        let chatsReducer = ChatsReducer(
            appState: appState, 
            webRepository: VKWebRepository()
        )

        let coordinator = Coordinator()

        self.appState = appState
        self.chatsReducer = chatsReducer
        self.coordinator = coordinator
    }

    var body: some Scene {
        WindowGroup {
            //
            // UIKit:
            //
//             VK.TabView()
            //
            //
            // SwiftUI:
            //
             ContentView()
            //
        }
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
        .environmentObject(coordinator)
    }
}
