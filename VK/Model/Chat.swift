import Foundation

struct Chat: Identifiable {
    var id: Int64

    var name: String
    var imgURL: URL
    var lastMessage: LastMessage
    var noSound: Bool
    var unreadCount: UInt?
    var online: Bool
    var pinned: Bool
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        lhs.id == rhs.id
    }
}
