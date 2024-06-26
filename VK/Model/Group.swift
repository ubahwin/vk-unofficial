import Foundation

struct Group {
    var id: Int64
    var name: String
    var imgURL: URL

    static var _stub: Self {
        Self(
            id: 0,
            name: "stub",
            imgURL: .stubImg
        )
    }
}
