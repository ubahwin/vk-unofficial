import SwiftUI

struct MessageCloud: View {
    let message: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(
                    maxWidth: 300
                )
            Text(message)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    MessageCloud(message: "Hello World!")
}
