import SwiftUI

struct CountPin: View {
    let unreadCount: UInt
    let color: Color
    let textColor: Color = .white

    private let width: CGFloat
    private let height: CGFloat

    private let fontSize: CGFloat

    init(pin: PinType, unreadCount: UInt, color: Color) {
        self.unreadCount = unreadCount
        self.color = color

        switch pin {
        case .small:
            switch unreadCount.digitCount {
            case 1:
                self.width = 18
            case 2:
                self.width = 23
            default:
                self.width = 28
            }

            self.height = 18
            self.fontSize = 12
        case .medium:
            switch unreadCount.digitCount {
            case 1:
                self.width = 24
            case 2:
                self.width = 29
            default:
                self.width = 34
            }

            self.height = 24
            self.fontSize = 16
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(color)
                .frame(width: width, height: height)

            Text(unreadCount.description)
                .foregroundStyle(textColor)
                .font(.system(size: fontSize, weight: .regular))
        }
    }

    enum PinType {
        case small, medium
    }
}

#Preview {
    CountPin(pin: .medium, unreadCount: 78, color: .blue)
}

#Preview {
    CountPin(pin: .small, unreadCount: 399, color: .red)
}
