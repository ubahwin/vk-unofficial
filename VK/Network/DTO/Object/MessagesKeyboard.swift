struct MessagesKeyboard: Codable {
    let authorId: Int?
//    let buttons: MessagesKeyboardButton[][]
    let oneTime: Bool
    let inline: Bool?

    enum CodingKeys: String, CodingKey, Codable {
        case authorId = "author_id"
        case oneTime = "one_time"
        case inline = "inline"
    }
}
