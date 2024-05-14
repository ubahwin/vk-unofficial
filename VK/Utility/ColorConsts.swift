import SwiftUI

struct ColorConsts {
    let selectedColor: Color
    let grayIcon: Color
    let blueText: Color

    static var lightTheme: Self { Self(
        selectedColor: Color(hex: 0xf5f5f7),
        grayIcon: Color(hex: 0xAEB7C2),
        blueText: Color(hex: 0x2688EB)
    )}
}
