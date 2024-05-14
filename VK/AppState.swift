import SwiftUI

final class AppState: ObservableObject {
    @Published var unreadCountChats: UInt?
    @Published var chats: [Chat] = []
    @Published var lastPinnedChatIndex = -1
    @Published var onlyUnreadMessages = false

    var chatsTotalCount: UInt = 500
    var chatsOffset: UInt = 0
    let chatsLimit = 15
}
