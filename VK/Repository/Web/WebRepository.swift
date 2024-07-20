import Combine
import MapKit

protocol WebRepository {
    func getConversations(offset: UInt) -> AnyPublisher<MessagesConversationsResponse, NetworkRequestError>
    func getConversationHistory(peerID: Int64) -> AnyPublisher<[Message], NetworkRequestError>
    func getConversationMembers(peerID: Int64) -> AnyPublisher<(Profiles, Groups), NetworkRequestError>
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

    func getConversationHistory(peerID: Int64) -> AnyPublisher<[Message], NetworkRequestError> {
        APIClient.dispatch(
            APIRouter.GetHistory(queryParams: ConversationHistoryParams(
                peerID: peerID
            ))
        )
        .map {
            guard let response = $0.response else {
                return []
            }

            return Mapper.conversationHistoryToModel(response)
        } // TODO: unwrap and check for error
        .eraseToAnyPublisher()
    }

    func getConversationMembers(peerID: Int64) -> AnyPublisher<(Profiles, Groups), NetworkRequestError> {
        APIClient.dispatch(
            APIRouter.GetConversationMembers(queryParams: ConversationMembersParams(
                peerID: peerID
            ))
        )
        .map {
            guard let response = $0.response else {
                return (Profiles(), Groups())
            }

            return Mapper.conversationMembersToModel(response)
        } // TODO: unwrap and check for error
        .eraseToAnyPublisher()
    }
}
