import Cocoa

enum Uncrustify: Executable {
    static let objcUTIs: Set<String> = [
        "public.objective-c-plus-plus-source",
        "public.objective-c-source"
    ]

    static let headerUTIs: Set<String> = [
        "public.c-header",
        "public.c-plus-plus-header",
        "public.precompiled-c-header"
    ]

    static let configName: String = "uncrustify.cfg"

    static let docName: String = "uncrustify-doc.txt"

    static let websiteURL = URL(string: "https://github.com/uncrustify/uncrustify")

    static let execPath: String = Bundle.main.path(forResource: "uncrustify", ofType: nil)!

    static func makePathExtension(uti: String) -> String? {
        nil
    }

    static func makeTaskArgs(
        uti: String,
        isFragmented: Bool,
        sourceFile: String
    ) throws -> [String] {
        var args = [String]()

        args.append("--replace")
        args.append("--no-backup")

        if objcUTIs.contains(uti) {
            args.append(contentsOf: ["-l", "OC"])
        } else if headerUTIs.contains(uti) {
            if let contents = try? String(contentsOfFile: sourceFile), contents.range(
                of: "#import|@",
                options: [.regularExpression]
            ) != nil {
                args.append(contentsOf: ["-l", "OC"])
            }
        }

        if isFragmented {
            args.append("--frag")
        }

        try args.append(contentsOf: ["-c", prepareUserConfig(sourceFile: sourceFile)])

        args.append(sourceFile)

        return args
    }

    static func appDidLaunch() {
        removeUserDoc()
    }
}
