import SwiftUI

struct Spliter: View {
    private let _padding: CGFloat

    init(padding: CGFloat = 0) {
        self._padding = padding
    }

    var body: some View {
        #if os(iOS)
        Divider()
            .background(Color(hex: 0xd7d8d9))
            .padding(.horizontal, _padding)
        #else
        Rectangle()
            .fill(Color(hex: 0xd7d8d9))
            .frame(height: 1)
            .padding(.horizontal, _padding)
        #endif
    }
}
