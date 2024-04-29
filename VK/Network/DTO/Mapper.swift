import Foundation

struct Mapper {
    static func cleanOfMetadata(_ messagesConversationsResponse: MessagesConversationsResponse) -> [Chat] {
        var profiles = [Int64: Profile]()

        for profile in messagesConversationsResponse.profiles {
            profiles[profile.id] = Profile(
                id: profile.id,
                firstName: profile.firstName,
                lastName: profile.lastName,
                imgURL: URL(string: profile.photo100) ?? .stubImg,
                online: profile.online.bool
            )
        }

        var groups = [Int64: Group]()

        for group in messagesConversationsResponse.groups {
            groups[group.id] = Group(
                id: group.id,
                name: group.name,
                imgURL: URL(string: group.photo100 ?? "") ?? .stubImg
            )
        }

        var chats = [Chat]()

        for item in messagesConversationsResponse.items {
            var name: String?
            var imgURL: URL?
            var noSound: Bool?
            var lastMessageProfile: Profile?
            var online: Bool?
            var attachment: Attachment?

            switch item.conversation.peer.type {
            case .chat:
                name = item.conversation.chatSettings?.title
                imgURL = URL(string: item.conversation.chatSettings?.photo?.photo100 ?? "")
            case .user:
                let profile = profiles[item.conversation.peer.id]

                online = profile?.online
                name = profile?.firstName + " " + profile?.lastName
                imgURL = profile?.imgURL
            default: continue
            }

            noSound = item.conversation.pushSettings?.noSound

            if let lastMessageProfileId: Int64 = item.lastMessage?.fromId {
                lastMessageProfile = profiles[lastMessageProfileId]

                if let group = groups[abs(lastMessageProfileId)] {
                    lastMessageProfile = Profile(
                        id: group.id,
                        firstName: group.name,
                        lastName: "",
                        imgURL: group.imgURL,
                        online: false
                    )
                }
            }

            if let attachmentTypeStr = item.lastMessage?.attachments.first?.type.rawValue {
                attachment = Attachment(rawValue: attachmentTypeStr)
            }

            let lastMessage = LastMessage(
                text: item.lastMessage?.text ?? "",
                from: lastMessageProfile ?? .stub,
                date: Date(timeIntervalSince1970: TimeInterval(item.lastMessage?.date ?? 0)), 
                attachment: attachment
            )

            let chat = Chat(
                name: name ?? "",
                imgURL: imgURL ?? .stubImg,
                lastMessage: lastMessage,
                noSound: noSound ?? false,
                unreadCount: item.conversation.unreadCount,
                online: online ?? false,
                pinned: item.conversation.sortId?.pinned != .not && item.conversation.sortId?.pinned != nil
            )

            chats.append(chat)
        }

        return chats
    }
}

extension Optional: Sequence where Wrapped: Sequence {
    public func makeIterator() -> AnyIterator<Wrapped.Element> {
        switch self {
        case .some(let value):
            return AnyIterator(value.makeIterator())
        case .none:
            return AnyIterator { nil }
        }
    }
}
