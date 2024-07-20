import SwiftUI

struct ConversationView: View {
    let chat: Chat

    @State private var newMessage = ""

    var body: some View {
        VStack(spacing: 0) {
            ConversationHeader(
                name: chat.name,
                image: chat.imgURL,
                noSound: chat.noSound,
                peopleCount: 5
            )

            Spacer()

            ChatMessagesView()

            Spacer()

            MessageField(message: $newMessage)
                .padding()
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
            .fill(Color(hex: 0xebedf0))

        ConversationView(chat: ._stub)
    }
    .preferredColorScheme(.light)
}
