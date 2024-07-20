import SwiftUI

final class AppState: ObservableObject {
    @Published var chats: [Chat] = []
    @Published var selectedChat: Chat?
    @Published var curMessages: [Message] = []

    @Published var unreadCountChats: UInt?
    @Published var lastPinnedChatIndex = -1
    @Published var onlyUnreadMessages = false

    @Published var curProfiles: [Int64: Profile] = [:]
    @Published var curGroups: [Int64: Group] = [:]

    var chatsTotalCount: UInt = 500
    var chatsOffset: UInt = 0
    let chatsLimit = 15
}
