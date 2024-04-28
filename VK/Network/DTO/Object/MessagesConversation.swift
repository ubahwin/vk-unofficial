struct MessagesConversation: Codable {
    let peer: Peer
    let sortId: SortId?
    let lastMessageId: Int
    let lastConversationMessageId: Int?
    let inRead: Int
    let outRead: Int
    let inReadCmid: Int?
    let outReadCmid: Int?
    let unreadCount: UInt?
    let isMarkedUnread: Bool?
    let outReadBy: OutReadBy?
    let important: Bool?
    let unanswered: Bool?
    let messageRequestData: MessageRequestData?
    let mentions: [Int]?
    let mentionCmids: [Int]?
    let expireMessages: [Int]?
    let expireCmids: [Int]?
    let currentKeyboard: MessagesKeyboard?
    let pushSettings: PushSettings?
    let canWrite: CanWrite?
    let canSendMoney: Bool?
    let canReceiveMoney: Bool?
    let chatSettings: ChatSettings?
    let callInProgress: CallInProgress?
    let isNew: Bool?
    let isArchived: Bool?
    let style: String?
    let folderIds: [Int]?
    let unreadReactions: [Int]?
    let peerFlags: Int?

    struct Peer: Codable {
        let id: Int64
        let localId: Int64?
        let type: PeerType
    }

    enum PeerType: String, Codable {
        case user, group, chat, email
    }

    struct SortId: Codable {
        let pinned: PinnedConversation?
        let minorId: Int64?

        enum CodingKeys: String, CodingKey, Codable {
            case pinned = "major_id"
            case minorId = "minor_id"
        }
    }

    enum PinnedConversation: Int, Codable {
        case not = 0

        case first = 16
        case second = 32
        case third = 48
        case fourth = 64
        case fifth = 80
    }

    struct OutReadBy: Codable {
        let count: Int?
        let memberIds: [Int]?
    }

    struct MessageRequestData: Codable {
        let status: String?
        let inviterId: Int64?
        let requestDate: Int?
    }

    struct PushSettings: Codable {
        let disabledForever: Bool?
        let disabledUntil: Int?
        let noSound: Bool?
        let disabledMentions: Bool?
        let disabledMassMentions: Bool?

        enum CodingKeys: String, CodingKey, Codable {
            case disabledForever = "disabled_forever"
            case disabledUntil = "disabled_until"
            case noSound = "no_sound"
            case disabledMentions = "disabled_mentions"
            case disabledMassMentions = "disabled_mass_mentions"
        }
    }

    struct CanWrite: Codable {
        let allowed: Bool?
        let reason: Int?
    }

    struct ChatSettingsPhoto: Codable {
        let photo50: String?
        let photo100: String?
        let photo200: String?
        let photoBase: String?
        let isDefaultPhoto: Bool?
        let isDefaultCallPhoto: Bool?

        enum CodingKeys: String, CodingKey, Codable {
            case photo50 = "photo_50"
            case photo100 = "photo_100"
            case photo200 = "photo_200"
            case photoBase = "photo_base"
            case isDefaultPhoto = "is_default_photo"
            case isDefaultCallPhoto = "is_default_call_photo"
        }
    }

    struct ChatSettingsAcl: Codable {
        let canChangeInfo: Bool
        let canChangeInviteLink: Bool
        let canChangePin: Bool
        let canInvite: Bool
        let canPromoteUsers: Bool
        let canSeeInviteLink: Bool
        let canModerate: Bool
        let canCopyChat: Bool
        let canCall: Bool
        let canUseMassMentions: Bool
        let canChangeServiceType: Bool?
        let canChangeStyle: Bool?
        let canSendReactions: Bool?

        enum CodingKeys: String, CodingKey, Codable {
            case canChangeInfo = "can_change_info"
            case canChangeInviteLink = "can_change_invite_link"
            case canChangePin = "can_change_pin"
            case canInvite = "can_invite"
            case canPromoteUsers = "can_promote_users"
            case canSeeInviteLink = "can_see_invite_link"
            case canModerate = "can_moderate"
            case canCopyChat = "can_copy_chat"
            case canCall = "can_call"
            case canUseMassMentions = "can_use_mass_mentions"
            case canChangeServiceType = "can_change_service_type"
            case canChangeStyle = "can_change_style"
            case canSendReactions = "can_send_reactions"
        }
    }

    enum ChatSettingsState: String, Codable {
        case kicked, out
        case inState = "in"
        case leftState = "left"
    }

    struct ChatSettingsPermissions: Codable {
        let invite: Permissions?
        let changeInfo: Permissions?
        let changePin: Permissions?
        let useMassMentions: Permissions?
        let seeInviteLink: Permissions?
        let call: Permissions?
        let changeAdmins: Permissions?
        let changeStyle: Permissions?

        enum Permissions: String, Codable {
            case owner, all
            case ownerAndAdmins = "owner_and_admins"
        }

        enum CodingKeys: String, CodingKey, Codable {
            case invite
            case changeInfo = "change_info"
            case changePin = "change_pin"
            case useMassMentions = "use_mass_mentions"
            case seeInviteLink = "see_invite_link"
            case call
            case changeAdmins = "change_admins"
            case changeStyle = "change_style"
        }
    }

    struct ChatSettings: Codable {
        let membersCount: Int?
        let friendsCount: Int?
        let ownerId: Int64
        let title: String
        let description: String?
        let pinnedMessage: MessagesPinnedMessage?
        let state: ChatSettingsState
        let photo: ChatSettingsPhoto?
        let adminIds: [Int64]?
        let isGroupChannel: Bool?
        let acl: ChatSettingsAcl
        let permissions: ChatSettingsPermissions?
        let isDisappearing: Bool?
        let theme: String?
        let disappearingChatLink: String?
        let isService: Bool?
        let isDonut: Bool?
        let donutOwnerId: Int?
        let shortPollReactions: Bool?

        enum CodingKeys: String, CodingKey, Codable {
            case membersCount = "members_count"
            case friendsCount = "friends_count"
            case ownerId = "owner_id"
            case title
            case description
            case pinnedMessage = "pinned_message"
            case state
            case photo
            case adminIds = "admin_ids"
            case isGroupChannel = "is_group_channel"
            case acl
            case permissions
            case isDisappearing = "is_disappearing"
            case theme
            case disappearingChatLink = "disappearing_chat_link"
            case isService = "is_service"
            case isDonut = "is_donut"
            case donutOwnerId = "donut_owner_id"
            case shortPollReactions = "short_poll_reactions"
        }
    }

    struct CallInProgress: Codable {
        let callId: String
        let participants: Participants

        struct Participants: Codable {
            let count: Int?
            let list: [Int]?
        }

        enum CodingKeys: String, CodingKey, Codable {
            case callId = "call_id"
            case participants
        }
    }

    enum CodingKeys: String, CodingKey, Codable {
        case peer
        case sortId = "sort_id"
        case lastMessageId = "last_message_id"
        case lastConversationMessageId = "last_conversation_message_id"
        case inRead = "in_read"
        case outRead = "out_read"
        case inReadCmid = "in_read_cmid"
        case outReadCmid = "out_read_cmid"
        case unreadCount = "unread_count"
        case isMarkedUnread = "is_marked_unread"
        case outReadBy = "out_read_by"
        case important
        case unanswered
        case messageRequestData = "message_request_data"
        case mentions
        case mentionCmids = "mention_cmids"
        case expireMessages = "expire_messages"
        case expireCmids = "expire_cmids"
        case currentKeyboard = "current_keyboardv"
        case pushSettings = "push_settings"
        case canWrite = "canWrite"
        case canSendMoney = "can_send_money"
        case canReceiveMoney = "can_receive_money"
        case chatSettings = "chat_settings"
        case callInProgress = "call_in_progress"
        case isNew = "is_new"
        case isArchived = "is_archived"
        case style
        case folderIds = "folder_ids"
        case unreadReactions = "unread_reactions"
        case peerFlags = "peer_flags"
    }
}
