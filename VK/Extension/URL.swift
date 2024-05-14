import Foundation

extension URL {
    static var stubImg: URL {
        URL(string: .stubImgURL)!
    }

    static var stub: URL {
        URL(string: .stubURL)!
    }
}

extension String {
    static var stubImgURL: String {
        String("https://picsum.photos/200")
    }

    static var stubURL: String { "google.com" }
}
