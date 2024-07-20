struct ConversationHistoryParams: Encodable {
    let accessToken: String = APIConstants.vkApiToken
    let version: String = APIConstants.vkApiVersion

    let peerID: Int64

    enum CodingKeys: String, CodingKey, Encodable {
        case accessToken = "access_token"
        case version = "v"
        case peerID = "peer_id"
    }
}
