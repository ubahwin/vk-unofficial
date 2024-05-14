import Combine

protocol IChatsReducer {
    func loadChats()
}

struct ChatsReducer: IChatsReducer {
    private let appState: AppState
    private let webRepository: WebRepository

    private let cancelBag = CancelBag()

    init(
        appState: AppState,
        webRepository: WebRepository
    ) {
        self.appState = appState
        self.webRepository = webRepository
    }

    func loadChats() {
        webRepository.getConversations(offset: appState.chatsOffset)
            // take metadata from dirty response
            .map { response in
                if let chatsTotalCount = response.count,
                   let unreadCountChats = response.unreadCount {
                    appState.chatsTotalCount = chatsTotalCount
                    appState.unreadCountChats = unreadCountChats
                }

                return Mapper.cleanOfMetadata(response)
            }
            // take last pinned chat from cleaned chats
            .map { chats in
                if let index = chats.firstIndex(where: { !$0.pinned }) {
                    appState.lastPinnedChatIndex = index - 1
                }

                return chats
            }
            // append chats and check for errors
            .sink { completion in
                if case let .failure(error) = completion {
                    Log.error(error.localizedDescription)
                } else {
                    appState.chatsOffset += 1
                }
            } receiveValue: { chats in
                appState.chats += chats
            }
            .store(in: cancelBag)
    }

    func refreshChats() {
        appState.chatsOffset = 0
        appState.chats = []
        loadChats()
    }
}
