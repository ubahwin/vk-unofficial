enum Attachment: String {
    case photo, video, audio, doc, market, wall, sticker, gift

    var title: String {
        switch self {
        case .photo: "Фотография"
        case .video: "Видео"
        case .audio: "Аудио"
        case .doc: "Файл"
        case .market: "Маркет"
        case .wall: "Запись"
        case .sticker: "Стикер"
        case .gift: "Подарок"
        }
    }
}
