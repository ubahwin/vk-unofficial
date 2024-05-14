import SwiftUI
import AppKit

@main
struct VKApp: App {
    private let appState: AppState
    private var chatsReducer: ChatsReducer
    private var coordinator: Coordinator

    #if canImport(UIKit)
    private let device = Device()
    #endif

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
//             VK.TabView()
             ContentView()
                #if os(macOS)
//                .background(Blur())
                .preferredColorScheme(.light)
                #endif
        }
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
        .environmentObject(coordinator)

        #if canImport(UIKit)
        .environment(\.device, device)
        #endif

        #if os(macOS)
        .windowToolbarStyle(.unifiedCompact(showsTitle: true))
        #endif
    }
}

#if os(macOS)
struct Blur: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.material = .underWindowBackground
        return visualEffectView
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
