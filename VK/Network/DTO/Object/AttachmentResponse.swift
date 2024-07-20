struct AttachmentResponse: Codable {
    let type: AttachmentType?
}

enum AttachmentType: String, Codable {
    case photo, video, audio, doc, market
    case link
    case marketAlbum = "market_album"
    case wall
    case wallReply = "wall_reply"
    case sticker, gift
    case poll
    case story
}
