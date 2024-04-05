import Cocoa

extension String {
    var bridged: NSString {
        self as NSString
    }

    var fileExisting: String? {
        if FileManager.default.fileExists(atPath: self) {
            return self
        } else {
            return nil
        }
    }
}

#if canImport(XcodeKit)
    import XcodeKit

    extension XCSourceTextBuffer {
        var indentationString: String {
            if usesTabsForIndentation {
                let tabCount = indentationWidth / tabWidth
                if tabCount * tabWidth == indentationWidth {
                    return String(repeating: "\t", count: tabCount)
                }
            }
            return String(repeating: " ", count: indentationWidth)
        }
    }
#endif
