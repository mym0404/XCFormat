import Cocoa
import OSLog

enum FormatterError: Error, LocalizedError, CustomNSError {
    case failure(reason: String)
    case execError(print: String)

    var localizedDescription: String {
        switch self {
        case let .failure(reason):
            return reason
        case let .execError(print):
            if print.contains(where: \.isNewline) {
                os_log(.error, log: .default, "[XCFormat] exec error: %{public}@", print)
                return "Error message is too long, please check the log in Console."
            } else {
                return print
            }
        }
    }

    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
