import Combine
import MapKit

protocol WebRepository {
    func getConversations(offset: UInt) -> AnyPublisher<MessagesConversationsResponse, NetworkRequestError>
}

struct VKWebRepository: WebRepository {
    func getConversations(offset: UInt) -> AnyPublisher<MessagesConversationsResponse, NetworkRequestError> {
        APIClient.dispatch(
            APIRouter.GetMessagesConvarsations(queryParams: MessagesConversationsParams(
                count: 20,
                fields: nil,
                offset: offset,
                filter: nil,
                startMessageId: nil,
                groupId: nil
            ))
        )
        .map {
            guard let response = $0.response else {
                return .init(count: nil, unreadCount: nil, items: [], profiles: nil, groups: nil)
            }

            return response
        } // TODO: unwrap and check for error
        .eraseToAnyPublisher()
    }
}
