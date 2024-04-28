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
            .map { response in
                if 
                    let chatsTotalCount = response.count,
                    let unreadCountChats = response.unreadCount
                {
                    appState.chatsTotalCount = chatsTotalCount
                    appState.unreadCountChats = unreadCountChats
                }

                return Mapper.cleanOfMetadata(response)
            }
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

    // MARK: Utility

    static var stub: Self {
        ChatsReducer(
            appState: AppState(),
            webRepository: VKWebRepository()
        )
    }
}
