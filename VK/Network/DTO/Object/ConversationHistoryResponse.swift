struct ConversationHistoryResponse: Codable {
    let count: Int?
    let items: [ConversationHistoryItem]?
}

class ConversationHistoryItem: Codable {
    let date, fromID, id, out: Int64?
    let version: Int?
    let attachments: [AttachmentResponse]?
    let conversationMessageID: Int?
    let fwdMessages: [ConversationHistoryItem]?
    let important, isHidden: Bool?
    let peerID, randomID: Int?
    let replyMessage: ConversationHistoryItem?
    let text: String?
    let updateTime: Int?

    enum CodingKeys: String, CodingKey {
        case date
        case fromID = "from_id"
        case id, out, version
        case attachments
        case conversationMessageID = "conversation_message_id"
        case fwdMessages = "fwd_messages"
        case important
        case isHidden = "is_hidden"
        case peerID = "peer_id"
        case randomID = "random_id"
        case replyMessage = "reply_message"
        case text
        case updateTime = "update_time"
    }
}
