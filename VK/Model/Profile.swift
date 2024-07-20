import Foundation

// peer_id -> Int64 
typealias Profiles = [Int64: Profile]

struct Profile {
    var id: Int64
    var firstName: String
    var lastName: String
    var imgURL: URL
    var online: Bool

    var short: String {
        firstName + " " + lastName.first?.description
    }
}
