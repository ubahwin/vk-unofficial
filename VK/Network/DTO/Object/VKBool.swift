enum VKBool: Int, Codable {
    case `false` = 0
    case `true` = 1

    var bool: Bool {
        if self == .true {
            return true
        }

        return false
    }
}
