import Combine

// swiftlint:disable type_body_length function_body_length file_length
struct StubWebRepository: WebRepository {
    func getConversationHistory(peerID: Int64) -> AnyPublisher<[Message], NetworkRequestError> {
        Just([
            ._stub,
            ._stub,
            ._stub
        ])
            .setFailureType(to: NetworkRequestError.self)
            .eraseToAnyPublisher()
    }

    func getConversations(offset: UInt) -> AnyPublisher<MessagesConversationsResponse, NetworkRequestError> {
        Just(MessagesConversationsResponse(
            count: 20,
            unreadCount: 3,
            items: [
                MessagesConversationsResponseItems(
                    conversation: MessagesConversation(
                        peer: MessagesConversation.Peer(
                            id: 1,
                            localId: 1,
                            type: .chat
                        ),
                        sortId: .init(
                            pinned: .first,
                            minorId: 16
                        ),
                        lastMessageId: 2,
                        lastConversationMessageId: 1,
                        inRead: 2,
                        outRead: 3,
                        inReadCmid: 1,
                        outReadCmid: 2,
                        unreadCount: 3,
                        isMarkedUnread: true,
                        outReadBy: .init(count: 2, memberIds: []),
                        important: false,
                        unanswered: false,
                        messageRequestData: .init(
                            status: "asd",
                            inviterId: 21,
                            requestDate: 13
                        ),
                        mentions: [],
                        mentionCmids: [],
                        expireMessages: [],
                        expireCmids: [],
                        currentKeyboard: .init(
                            authorId: 1,
                            oneTime: false,
                            inline: false
                        ),
                        pushSettings: .init(
                            disabledForever: false,
                            disabledUntil: 1,
                            noSound: false,
                            disabledMentions: false,
                            disabledMassMentions: false
                        ),
                        canWrite: .init(
                            allowed: false,
                            reason: 1
                        ),
                        canSendMoney: false,
                        canReceiveMoney: false,
                        chatSettings: .init(
                            membersCount: 1,
                            friendsCount: 2,
                            ownerId: 3,
                            title: "asd",
                            description: "asd",
                            pinnedMessage: .init(
                                conversationMessageId: 1,
                                id: 2,
                                date: 3,
                                fromId: 1,
                                peerId: 5,
                                text: "Pinned msg",
                                keyboard: .init(authorId: 1, oneTime: false, inline: false),
                                isUnavailable: false
                            ),
                            state: .leftState,
                            photo: .init(
                                photo50: .stubImgURL,
                                photo100: .stubImgURL,
                                photo200: .stubImgURL,
                                photoBase: .stubImgURL,
                                isDefaultPhoto: false,
                                isDefaultCallPhoto: false
                            ),
                            adminIds: [],
                            isGroupChannel: false,
                            acl: .init(
                                canChangeInfo: false,
                                canChangeInviteLink: false,
                                canChangePin: false,
                                canInvite: false,
                                canPromoteUsers: false,
                                canSeeInviteLink: false,
                                canModerate: false,
                                canCopyChat: false,
                                canCall: false,
                                canUseMassMentions: false,
                                canChangeServiceType: false,
                                canChangeStyle: false,
                                canSendReactions: false
                            ),
                            permissions: .init(
                                invite: .all,
                                changeInfo: .all,
                                changePin: .all,
                                useMassMentions: .all,
                                seeInviteLink: .all,
                                call: .all,
                                changeAdmins: .all,
                                changeStyle: .all
                            ),
                            isDisappearing: false,
                            theme: "asd",
                            disappearingChatLink: "asd",
                            isService: false,
                            isDonut: false,
                            donutOwnerId: 1,
                            shortPollReactions: false
                        ),
                        callInProgress: .init(callId: "asf", participants: .init(count: 1, list: [])),
                        isNew: false,
                        isArchived: false,
                        style: "zdf",
                        folderIds: [],
                        unreadReactions: [],
                        peerFlags: 1
                    ),
                    lastMessage: MessagesMessage(
                        version: 1,
                        action: .init(
                            type: .chatCreate,
                            conversationMessageId: 2,
                            memberId: 1,
                            message: "asf",
                            photo: .photo50,
                            style: "asf",
                            text: "qwrqwr",
                            oldText: "asfasfasf"
                        ),
                        conversationMessageId: 1,
                        date: 2,
                        deleted: .false,
                        fromId: 1,
                        id: 2,
                        important: false,
                        isHidden: false,
                        keyboard: .init(authorId: 1, oneTime: false, inline: false),
                        membersCount: 2,
                        messageTag: "false",
                        out: .false,
                        payload: "false",
                        peerId: 1,
                        randomId: 2,
                        ref: "false",
                        refSource: "false",
                        reactionId: 3,
                        lastReactionId: 1,
                        isPinned: false,
                        text: "last message",
                        updateTime: 2,
                        expireTtl: 3,
                        ttl: 1,
                        isExpired: false,
                        wasListened: false,
                        wasPlayed: false,
                        pinnedAt: 2,
                        isSilent: false,
                        isMentionedUser: false,
                        isUnavailable: false,
                        adminAuthorId: 1,
                        attachments: []
                    )
                ),
                MessagesConversationsResponseItems(
                    conversation: MessagesConversation(
                        peer: MessagesConversation.Peer(
                            id: 2,
                            localId: 1,
                            type: .user
                        ),
                        sortId: .init(
                            pinned: .first,
                            minorId: 16
                        ),
                        lastMessageId: 3,
                        lastConversationMessageId: 1,
                        inRead: 2,
                        outRead: 3,
                        inReadCmid: 1,
                        outReadCmid: 2,
                        unreadCount: 3,
                        isMarkedUnread: true,
                        outReadBy: .init(count: 2, memberIds: []),
                        important: false,
                        unanswered: false,
                        messageRequestData: .init(
                            status: "asd",
                            inviterId: 21,
                            requestDate: 13
                        ),
                        mentions: [],
                        mentionCmids: [],
                        expireMessages: [],
                        expireCmids: [],
                        currentKeyboard: .init(
                            authorId: 1,
                            oneTime: false,
                            inline: false
                        ),
                        pushSettings: .init(
                            disabledForever: false,
                            disabledUntil: 1,
                            noSound: false,
                            disabledMentions: false,
                            disabledMassMentions: false
                        ),
                        canWrite: .init(
                            allowed: false,
                            reason: 1
                        ),
                        canSendMoney: false,
                        canReceiveMoney: false,
                        chatSettings: .init(
                            membersCount: 1,
                            friendsCount: 2,
                            ownerId: 3,
                            title: "asd",
                            description: "asd",
                            pinnedMessage: .init(
                                conversationMessageId: 1,
                                id: 2,
                                date: 3,
                                fromId: 2,
                                peerId: 5,
                                text: "Pinned msg",
                                keyboard: .init(authorId: 1, oneTime: false, inline: false),
                                isUnavailable: false
                            ),
                            state: .leftState,
                            photo: .init(
                                photo50: .stubImgURL,
                                photo100: .stubImgURL,
                                photo200: .stubImgURL,
                                photoBase: .stubImgURL,
                                isDefaultPhoto: false,
                                isDefaultCallPhoto: false
                            ),
                            adminIds: [],
                            isGroupChannel: false,
                            acl: .init(
                                canChangeInfo: false,
                                canChangeInviteLink: false,
                                canChangePin: false,
                                canInvite: false,
                                canPromoteUsers: false,
                                canSeeInviteLink: false,
                                canModerate: false,
                                canCopyChat: false,
                                canCall: false,
                                canUseMassMentions: false,
                                canChangeServiceType: false,
                                canChangeStyle: false,
                                canSendReactions: false
                            ),
                            permissions: .init(
                                invite: .all,
                                changeInfo: .all,
                                changePin: .all,
                                useMassMentions: .all,
                                seeInviteLink: .all,
                                call: .all,
                                changeAdmins: .all,
                                changeStyle: .all
                            ),
                            isDisappearing: false,
                            theme: "asd",
                            disappearingChatLink: "asd",
                            isService: false,
                            isDonut: false,
                            donutOwnerId: 1,
                            shortPollReactions: false
                        ),
                        callInProgress: .init(callId: "asf", participants: .init(count: 1, list: [])),
                        isNew: false,
                        isArchived: false,
                        style: "zdf",
                        folderIds: [],
                        unreadReactions: [],
                        peerFlags: 1
                    ),
                    lastMessage: MessagesMessage(
                        version: 1,
                        action: .init(
                            type: .chatCreate,
                            conversationMessageId: 2,
                            memberId: 1,
                            message: "asf",
                            photo: .photo50,
                            style: "asf",
                            text: "qwrqwr",
                            oldText: "asfasfasf"
                        ),
                        conversationMessageId: 1,
                        date: 2,
                        deleted: .false,
                        fromId: 2,
                        id: 2,
                        important: false,
                        isHidden: false,
                        keyboard: .init(authorId: 1, oneTime: false, inline: false),
                        membersCount: 2,
                        messageTag: "false",
                        out: .false,
                        payload: "false",
                        peerId: 1,
                        randomId: 2,
                        ref: "false",
                        refSource: "false",
                        reactionId: 3,
                        lastReactionId: 1,
                        isPinned: false,
                        text: "last fafsaasf",
                        updateTime: 2,
                        expireTtl: 3,
                        ttl: 1,
                        isExpired: false,
                        wasListened: false,
                        wasPlayed: false,
                        pinnedAt: 2,
                        isSilent: false,
                        isMentionedUser: false,
                        isUnavailable: false,
                        adminAuthorId: 1,
                        attachments: [
                            .init(type: .wall)
                        ]
                    )
                )
            ],
            profiles: [
                UsersUser(
                    id: 1,
                    firstName: "Иван",
                    firstNameAcc: "Вдовин",
                    lastName: "Николаевич",
                    lastNameAcc: "ADfsad",
                    isClosed: false,
                    canAccessClosed: true,
                    deactivated: .none,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL,
                    online: .true,
                    onlineMobile: .true,
                    sex: .male
                ),
                UsersUser(
                    id: 2,
                    firstName: "asgdsdg",
                    firstNameAcc: "qwer",
                    lastName: "rit",
                    lastNameAcc: "as",
                    isClosed: false,
                    canAccessClosed: true,
                    deactivated: .banned,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL,
                    online: .false,
                    onlineMobile: .false,
                    sex: .female
                ),
                UsersUser(
                    id: 3,
                    firstName: "123",
                    firstNameAcc: "457",
                    lastName: "9678",
                    lastNameAcc: "123",
                    isClosed: false,
                    canAccessClosed: false,
                    deactivated: .none,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL,
                    online: .true,
                    onlineMobile: .true,
                    sex: .male
                )
            ],
            groups: [
                GroupsGroup(
                    id: 4,
                    name: "Club",
                    screenName: "Club Group",
                    privacy: .open,
                    type: .group,
                    isAdmin: .true,
                    adminLevel: .admin,
                    isMember: .true,
                    isAdvertiser: .none,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL
                ),
                GroupsGroup(
                    id: 5,
                    name: "Group",
                    screenName: "Group",
                    privacy: .closed,
                    type: .group,
                    isAdmin: .false,
                    adminLevel: .none,
                    isMember: .false,
                    isAdvertiser: .true,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL
                ),
                GroupsGroup(
                    id: 6,
                    name: "qwr",
                    screenName: "axcvb",
                    privacy: .private,
                    type: .event,
                    isAdmin: .false,
                    adminLevel: .none,
                    isMember: .true,
                    isAdvertiser: .false,
                    photo50: .stubImgURL,
                    photo100: .stubImgURL
                )
            ]
        ))
        .setFailureType(to: NetworkRequestError.self)
        .eraseToAnyPublisher()
    }

    func getConversationMembers(peerID: Int64) -> AnyPublisher<(Profiles, Groups), NetworkRequestError> {
        Just((Profiles(), Groups()))
            .setFailureType(to: NetworkRequestError.self)
            .eraseToAnyPublisher()
    }
}
// swiftlint:enable type_body_length function_body_length file_length
