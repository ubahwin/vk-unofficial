struct MessagesPinnedMessage: Codable {
    let conversationMessageId: Int?
    let id: Int
    let date: Int
    let fromId: Int
    let peerId: Int
    let text: String
    let keyboard: MessagesKeyboard?
    let isUnavailable: Bool?

    enum CodingKeys: String, CodingKey, Codable {
        case conversationMessageId = "conversation_message_id"
        case id
        case date
        case fromId = "from_id"
        case peerId = "peer_id"
        case text
        case keyboard
        case isUnavailable = "is_unavailable"
    }
}
