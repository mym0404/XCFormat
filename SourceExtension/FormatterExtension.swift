import Cocoa
import XcodeKit

class FormatterExtension: NSObject, XCSourceEditorExtension {
    func extensionDidFinishLaunching() {
        Uncrustify.appDidLaunch()
    }
}
