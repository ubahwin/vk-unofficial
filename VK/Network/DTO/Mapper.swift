import Foundation

struct Mapper {
    // swiftlint:disable function_body_length
    static func cleanOfMetadata(
        _ messagesConversationsResponse: MessagesConversationsResponse
    ) -> [Chat] {
        var chats = [Chat]()

        let (profiles, groups) = self.getProfilesAndGroups(messagesConversationsResponse)

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

            if let attachmentTypeStr = item.lastMessage?.attachments.first?.type?.rawValue {
                attachment = Attachment(rawValue: attachmentTypeStr)
            }

            let lastMessage = LastMessage(
                text: item.lastMessage?.text ?? "",
                from: lastMessageProfile ?? ._stub,
                date: Date(timeIntervalSince1970: TimeInterval(item.lastMessage?.date ?? 0)),
                attachment: attachment
            )

            let chat = Chat(
                id: item.conversation.peer.id,
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
    // swiftlint:enable function_body_length

    static func getProfilesAndGroups(
        _ messagesConversationsResponse: MessagesConversationsResponse
    ) -> (Profiles, Groups) {
        var profiles = Profiles()

        for profile in messagesConversationsResponse.profiles {
            profiles[profile.id] = Profile(
                id: profile.id,
                firstName: profile.firstName,
                lastName: profile.lastName,
                imgURL: URL(string: profile.photo100) ?? .stubImg,
                online: profile.online?.bool ?? false
            )
        }

        var groups = Groups()

        for group in messagesConversationsResponse.groups {
            groups[group.id] = Group(
                id: group.id,
                name: group.name,
                imgURL: URL(string: group.photo100 ?? "") ?? .stubImg
            )
        }

        return (profiles, groups)
    }

    static func conversationHistoryToModel(_ response: ConversationHistoryResponse) -> [Message] {
        response.items?.compactMap { item in
            guard
                let id: Int64 = item.id,
                let fromID: Int64 = item.fromID,
                let text: String = item.text
//                let attachments: [Attachment] = item.attachments
            else { return nil }

            return Message(
                id: id,
                fromID: fromID,
                text: text,
                attachments: nil
            )
        } ?? []
    }

    static func conversationMembersToModel(_ response: ConversationMembersResponse) -> (Profiles, Groups) {
        var profiles = Profiles()

        for profile in response.profiles {
            profiles[profile.id] = Profile(
                id: profile.id,
                firstName: profile.firstName,
                lastName: profile.lastName,
                imgURL: URL(string: profile.photo100) ?? .stubImg,
                online: profile.online?.bool ?? false
            )
        }

        var groups = Groups()

        for group in response.groups {
            groups[group.id] = Group(
                id: group.id,
                name: group.name,
                imgURL: URL(string: group.photo100 ?? "") ?? .stubImg
            )
        }

        return (profiles, groups)
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
