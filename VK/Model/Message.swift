import Foundation

struct Message: Identifiable {
    let id: Int64
    let fromID: Int64

    let text: String
    let attachments: [Attachment]?
}
