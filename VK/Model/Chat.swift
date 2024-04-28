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

    static var stub: Self {
        Self(
            name: "Stub",
            imgURL: .stubImg,
            lastMessage: LastMessage(
                text: "stub",
                from: .stub,
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
