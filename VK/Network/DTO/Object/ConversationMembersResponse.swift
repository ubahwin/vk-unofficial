struct ConversationMembersResponse: Codable {
    let count: Int?
    let items: [ConversationMembersItem]?
    let profiles: [UsersUser]?
    let groups: [GroupsGroup]?
}

struct ConversationMembersItem: Codable {
    let memberID: Int?

    enum CodingKeys: String, CodingKey {
        case memberID = "member_id"
    }
}
