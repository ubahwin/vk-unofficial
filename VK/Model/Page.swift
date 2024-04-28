enum Page: String, CaseIterable, Identifiable {
    case feed, chats

    var id: String {
        self.rawValue
    }
}

enum Sheet: String, CaseIterable, Identifiable {
    case newChat

    var id: String {
        self.rawValue
    }
}
