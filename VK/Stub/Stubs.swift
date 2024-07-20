import SwiftUI

extension ChatsReducer {
    static var _stub: Self {
        ChatsReducer(
            appState: AppState(),
            webRepository: VKWebRepository()
        )
    }
}

extension Chat {
    static var _stub: Self {
        Self(
            id: 0,
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

extension Message {
    static var _stub: Self {
        Self(
            id: 0,
            fromID: 0,
            text: "sometext",
            attachments: [.photo]
        )
    }
}

extension Group {
    static var _stub: Self {
        Self(
            id: 0,
            name: "stub",
            imgURL: .stubImg
        )
    }

}

extension Profile {
    static var _stub: Self {
        Self(
            id: 0,
            firstName: "stub",
            lastName: "stub",
            imgURL: .stubImg,
            online: true
        )
    }
}
