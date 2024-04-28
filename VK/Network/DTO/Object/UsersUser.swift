struct UsersUser: Codable {
    let id: Int64
    let firstName: String
    let firstNameAcc: String?
    let lastName: String
    let lastNameAcc: String?

    /// Закрыта ли страница. Не возвращается, если пользователь удален или заблокирован
    let isClosed: Bool?

    /// Есть ли доступ к странице. Не возвращается, если пользователь удален или заблокирован
    let canAccessClosed: Bool?

    let deactivated: UserDeactivationCause?
    let photo50: String
    let photo100: String

    let online: VKBool
    let onlineMobile: VKBool?

    let sex: Sex?

    enum UserDeactivationCause: String, Codable {
        case deleted = "deleted"
        case banned = "banned"
    }

    enum Sex: Int, Codable {
        case unknown = 0
        case female = 1
        case male = 2
    }

    enum CodingKeys: String, CodingKey, Codable {
        case id
        case firstName = "first_name"
        case firstNameAcc = "first_name_acc"
        case lastName = "last_name"
        case lastNameAcc = "v"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case deactivated
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case sex
        case online = "online"
        case onlineMobile = "online_mobile"
    }
}
