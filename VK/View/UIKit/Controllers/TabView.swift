import SwiftUI

struct TabView: UIViewControllerRepresentable {
    @Environment(\.chatsReducer) var chatsReducer: ChatsReducer

    func makeUIViewController(context: Context) -> UITabBarController {
        TabBarViewController()
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) { }
}

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        setupTabItems()

        self.tabBar.barTintColor = UIColor(hex: 0x99A2AD)
        self.tabBar.tintColor = UIColor(hex: 0x2975CC)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
    }

    override func viewDidAppear(_ animated: Bool) {
        // TODO: load data
    }

    private func setupTabItems() {
        let feed = UINavigationController(rootViewController: Feed())
        let chats = UINavigationController(rootViewController: Chats())

        feed.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "home_gray"), selectedImage: nil)
        chats.tabBarItem = UITabBarItem(title: "Чаты", image: UIImage(named: "chats_gray"), selectedImage: nil)

        self.setViewControllers([chats, feed], animated: false)
    }
}
