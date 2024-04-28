import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?

    func push(_ page: Page) {
        path.append(page)
    }

    func present(sheet: Sheet) {
        self.sheet = sheet
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .feed:
            FeedView()
        case .chats:
            ChatsView()
        }
    }
}
