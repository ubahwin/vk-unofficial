struct MessagesConversationsResponse: Codable {
    let count: UInt?
    let unreadCount: UInt?
    let items: [MessagesConversationsResponseItems]
    let profiles: [UsersUser]?
    let groups: [GroupsGroup]?

    enum CodingKeys: String, CodingKey, Codable {
        case count = "count"
        case unreadCount = "unread_count"
        case items = "items"
        case profiles = "profiles"
        case groups = "groups"
    }
}

struct MessagesConversationsResponseItems: Codable {
    let conversation: MessagesConversation
    let lastMessage: MessagesMessage?

    enum CodingKeys: String, CodingKey, Codable {
        case conversation
        case lastMessage = "last_message"
    }
}

struct MessagesConversationsParams: Encodable {
    let accessToken: String = APIConstants.vkApiToken
    let v: String = APIConstants.vkApiVersion

    let count: Int?
    let fields: String?
    let extended: VKBool? = .true
    let offset: UInt?
    let filter: Filter?
    let startMessageId: Int?
    let groupId: Int?

    enum Filter: String, Encodable {
        case all, archive, chats, important, unanswered, unread
        case businessNotify = "business_notify"
        case messageRequest = "message_request"
    }

    enum CodingKeys: String, CodingKey, Encodable {
        case accessToken = "access_token"
        case v
        case count
        case fields
        case extended
        case offset
        case filter
        case startMessageId = "start_message_id"
        case groupId = "group_id"
    }
}
