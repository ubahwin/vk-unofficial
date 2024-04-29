import SwiftUI

extension ChatsReducer: EnvironmentKey {
    static var defaultValue: Self { stub }
}

extension Device: EnvironmentKey {
    static var defaultValue: Self { Self() }
}

extension EnvironmentValues {
    var chatsReducer: ChatsReducer {
        get { self[ChatsReducer.self] }
        set { self[ChatsReducer.self] = newValue }
    }

    var device: Device {
        get { self[Device.self] }
        set { self[Device.self] = newValue }
    }
}
