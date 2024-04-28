struct MessagesPinnedMessage: Codable {
    let conversation_message_id: Int?
    let id: Int
    let date: Int
    let from_id: Int
    let peer_id: Int
    let text: String
    let keyboard: MessagesKeyboard?
    let is_unavailable: Bool?
}
