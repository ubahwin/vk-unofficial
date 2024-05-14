import SwiftUI

extension ChatsReducer: EnvironmentKey {
    static var defaultValue: Self { _stub }
}

#if canImport(UIKit)
extension Device: EnvironmentKey {
    static var defaultValue: Self { Self() }
}
#endif

extension ColorConsts: EnvironmentKey {
    static var defaultValue: Self { lightTheme }
}

extension EnvironmentValues {
    var chatsReducer: ChatsReducer {
        get { self[ChatsReducer.self] }
        set { self[ChatsReducer.self] = newValue }
    }

    #if canImport(UIKit)
    var device: Device {
        get { self[Device.self] }
        set { self[Device.self] = newValue }
    }
    #endif

    var colors: ColorConsts {
        get { self[ColorConsts.self] }
        set { self[ColorConsts.self] = newValue }
    }
}
