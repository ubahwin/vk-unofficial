import SwiftUI

struct ChatMessagesView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.chatsReducer) private var chatsReducer: ChatsReducer

    var body: some View {
        ScrollView {
            VStack {
                ForEach(appState.curMessages) { message in
                    MessageCloud(message: message.text)
                }
            }
        }
        .onReceive(appState.$selectedChat) { selectedChat in
            guard let chat = selectedChat else { return }

            chatsReducer.getMessages(from: chat)
        }
    }
}

#Preview {
    let appState = AppState()
    let chatsReducer: ChatsReducer = ._stub
    let colors: ColorConsts = .lightTheme

    appState.curMessages = [
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub
    ]

    return ChatMessagesView()
        .environment(\.chatsReducer, chatsReducer)
        .environment(\.colors, colors)
        .environmentObject(appState)

        .preferredColorScheme(.light)
}
