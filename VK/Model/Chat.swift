import Foundation

struct Chat: Identifiable {
    var id = UUID()

    var name: String
    var imgURL: URL
    var lastMessage: LastMessage
    var noSound: Bool
    var unreadCount: UInt?
    var online: Bool
    var pinned: Bool

    static var _stub: Self {
        Self(
            name: "Stub",
            imgURL: .stubImg,
            lastMessage: LastMessage(
                text: "stub",
                from: ._stub,
                date: Date(),
                attachment: .wall
            ),
            noSound: true,
            unreadCount: 3,
            online: true,
            pinned: true
        )
    }
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        lhs.id == rhs.id
    }
}
