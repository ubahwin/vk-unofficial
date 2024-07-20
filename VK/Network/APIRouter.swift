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

    struct GetHistory: Request {
        typealias ReturnType = Result<ConversationHistoryResponse>

        var path: String = "method/messages.getHistory"
        var method: HTTPMethod = .post
        var queryParams: [String: Any]?

        init(queryParams: ConversationHistoryParams) {
            self.queryParams = queryParams.asDictionary
        }
    }

    struct GetConversationMembers: Request {
        typealias ReturnType = Result<ConversationMembersResponse>

        var path: String = "method/messages.getConversationMembers"
        var method: HTTPMethod = .post
        var queryParams: [String: Any]?

        init(queryParams: ConversationMembersParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
}
