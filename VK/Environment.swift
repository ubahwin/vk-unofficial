import SwiftUI

extension ChatsReducer: EnvironmentKey {
    static var defaultValue: Self { stub }
}

extension EnvironmentValues {
    var chatsReducer: ChatsReducer {
        get { self[ChatsReducer.self] }
        set { self[ChatsReducer.self] = newValue }
    }
}
