import SwiftUI

extension ChatsReducer {
    static var _stub: Self {
        ChatsReducer(
            appState: AppState(),
            webRepository: VKWebRepository()
        )
    }
}
