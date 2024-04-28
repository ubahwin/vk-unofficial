import Foundation

struct LastMessage {
    var text: String
    var from: Profile
    var date: Date
    var attachment: Attachment?

    enum Attachment {
        case photo, video, audio, doc, market, wall, sticker, gift

        var title: String {
            switch self {
            case .photo: "Фото"
            case .video: "Видео"
            case .audio: "Аудио"
            case .doc: "Документ"
            case .market: "Маркет"
            case .wall: "Запись"
            case .sticker: "Стикер"
            case .gift: "Подарок"
            }
        }
    }
}
