import Cocoa

enum AppGroup {
    static let sharedIdentifier = "J2XWB65W94.group.com.sugarmo.XCFormat"

    static func makeRootPath() -> String? {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: sharedIdentifier)?
            .path
    }
}
