import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension UIColor {
    public convenience init?(hex: Int) {
        guard hex <= 0xffffffff else { return nil }

        let red = CGFloat((hex & 0xff000000) >> 24) / 255
        let green = CGFloat((hex & 0x00ff0000) >> 16) / 255
        let blue = CGFloat((hex & 0x0000ff00) >> 8) / 255
        let alpha = CGFloat(hex & 0x000000ff) / 255

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
