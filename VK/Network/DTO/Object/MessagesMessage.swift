import Foundation

struct MessagesMessage: Codable {
    let version: Int
    let action: MessagesMessageAction?
    let conversationMessageId: Int64?
    let date: Int
    let deleted: VKBool?
    let fromId: Int64
    let id: Int64
    let important: Bool?
    let isHidden: Bool?
    let keyboard: MessagesKeyboard?
    let membersCount: Int?
    let messageTag: String?
    let out: VKBool
    let payload: String?
    let peerId: Int64
    let randomId: Int64?
    let ref: String?
    let refSource: String?
    let reactionId: Int64?
    let lastReactionId: Int64?
    let isPinned: Bool?
    let text: String
    let updateTime: Int?
    let expireTtl: Int?
    let ttl: Int?
    let isExpired: Bool?
    let wasListened: Bool?
    let wasPlayed: Bool?
    let pinnedAt: Int?
    let isSilent: Bool?
    let isMentionedUser: Bool?
    let isUnavailable: Bool?
    let adminAuthorId: Int64?
    let attachments: [AttachmentResponse]

    enum CodingKeys: String, CodingKey, Codable {
        case version
        case action
        case conversationMessageId = "conversation_message_id"
        case date
        case deleted
        case fromId = "from_id"
        case id
        case important
        case isHidden = "is_hidden"
        case keyboard
        case membersCount = "members_count"
        case messageTag = "message_tag"
        case out
        case payload
        case peerId = "peer_id"
        case randomId = "random_id"
        case ref
        case refSource = "ref_source"
        case reactionId = "reaction_id"
        case lastReactionId = "last_reaction_id"
        case isPinned = "is_pinned"
        case text
        case updateTime = "update_time"
        case expireTtl = "expire_ttl"
        case ttl
        case isExpired = "is_expired"
        case wasListened = "was_listened"
        case wasPlayed = "was_played"
        case pinnedAt = "pinned_at"
        case isSilent = "is_silent"
        case isMentionedUser = "is_mentioned_user"
        case isUnavailable = "is_unavailable"
        case adminAuthorId = "admin_author_id"
        case attachments = "attachments"
    }
}

struct MessagesMessageAction: Codable {
    let type: ChatType
    let conversationMessageId: Int64?
    let memberId: Int64?
    /// Message body of related message
    let message: String?
    let photo: PhotoType?
    let style: String?
    /// New chat title for chat_create and chat_title_update actions
    let text: String?
    /// Previous chat title for chat_title_update action
    let oldText: String?

    enum PhotoType: String, Codable {
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case photoBase = "photo_base"
    }

    enum ChatType: String, Codable {
        case chatCreate = "chat_create"
        case chatTitleUpdate = "chat_title_update"
        case chatPhotoUpdate = "chat_photo_update"
        case chatPhotoRemove = "chat_photo_remove"
        case chatInviteUser = "chat_invite_user"
        case chatKickUser = "chat_kick_user"
        case chatPinMessage = "chat_pin_message"
        case chatUnpinMessage = "chat_unpin_message"
        case chatKickDon = "chat_kick_don"
        case conversationStyleUpdate = "conversation_style_update"
        case conversationStyleUpdateAction = "conversation_style_update_action"
        case callTranscriptionFailed = "call_transcription_failed"
        case custom = "custom"
        case chatInviteUserByLink = "chat_invite_user_by_link"
        case chatInviteUserByMessageRequest = "chat_invite_user_by_message_request"
        case chatScreenshot = "chat_screenshot"
        case chatGroupCallStarted = "chat_group_call_started"
        case acceptedMessageRequest = "accepted_message_request"
        case chatInviteUserByCall = "chat_invite_user_by_call"
        case chatInviteUserByCallJoinLink = "chat_invite_user_by_call_join_link"
        case chatKickUserCallBlock = "chat_kick_user_call_block"
    }

    enum CodingKeys: String, CodingKey, Codable {
        case type
        case conversationMessageId = "conversation_message_id"
        case memberId = "member_id"
        case message
        case photo
        case style
        case text
        case oldText = "old_text"
    }
}
