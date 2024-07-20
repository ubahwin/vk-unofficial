import Foundation

typealias Groups = [Int64: Group]

struct Group {
    var id: Int64
    var name: String
    var imgURL: URL
}
