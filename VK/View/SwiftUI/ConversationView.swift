import SwiftUI

struct ConversationView: View {
    let chat: Chat

    @State private var newMessage = ""

    var body: some View {
        VStack {
            ConversationHeader(
                name: chat.name,
                image: chat.imgURL,
                noSound: chat.noSound,
                peopleCount: 5
            )

            Spacer()

            Text(chat.name)

            Spacer()

            MessageField(message: $newMessage)
                .padding()
        }
    }
}

#Preview {
    ConversationView(chat: ._stub)
}
