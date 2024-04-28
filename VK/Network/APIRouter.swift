import Foundation

class APIRouter {
    struct GetMessagesConvarsations: Request {
        typealias ReturnType = Result<MessagesConversationsResponse>

        var path: String = "method/messages.getConversations"
        var method: HTTPMethod = .post
        var queryParams: [String: Any]?

        init(queryParams: MessagesConversationsParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
}
