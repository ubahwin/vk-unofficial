struct ConversationMembersParams: Encodable {
    let accessToken: String = APIConstants.vkApiToken
    let version: String = APIConstants.vkApiVersion

    let peerID: Int64
}
