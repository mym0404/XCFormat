import Cocoa

enum AppGroup {
    static let sharedIdentifier = "7U49RNK4H7.group.com.mjstudio.XCFormat"

    static func makeRootPath() -> String? {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: sharedIdentifier)?
            .path
    }
}
