import Foundation

struct GroupsGroup: Codable {
    let id: Int64
    let name: String
    let screenName: String
    let privacy: Privacy
    let type: GroupType?
    let isAdmin: VKBool?
    let adminLevel: AdminLevel?
    let isMember: VKBool?
    let isAdvertiser: VKBool?
    let photo50: String?
    let photo100: String?

    enum GroupType: String, Codable {
        case group = "group"
        case page = "page"
        case event = "event"
    }

    enum Privacy: Int, Codable {
        case open = 0
        case closed = 1
        case `private` = 2
    }

    enum AdminLevel: Int, Codable {
        case moderator = 1
        case editor = 2
        case admin = 3
    }

    enum CodingKeys: String, CodingKey, Codable {
        case id = "id"
        case name = "name"
        case screenName = "screen_name"
        case privacy = "is_closed"
        case type = "type"
        case isAdmin = "is_admin"
        case adminLevel = "admin_level"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
    }
}
