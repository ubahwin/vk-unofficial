import Foundation

struct Profile {
    var id: Int64
    var firstName: String
    var lastName: String
    var imgURL: URL
    var online: Bool

    var short: String {
        firstName + " " + lastName.first?.description
    }

    static var _stub: Self {
        Self(
            id: 0,
            firstName: "stub",
            lastName: "stub",
            imgURL: .stubImg,
            online: true
        )
    }
}
