import Cocoa
import OSLog

enum FormatterError: Error, LocalizedError, CustomNSError {
    case failure(reason: String)
    case execError(print: String)

    var localizedDescription: String {
        switch self {
        case let .failure(reason):
            reason
        case let .execError(print):
            print
        }
    }

    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
