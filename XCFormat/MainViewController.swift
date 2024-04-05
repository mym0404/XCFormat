import Cocoa

class MainViewController: NSViewController {

    // MARK: - Uncrustify

    @IBAction func uncrustifyConfig(_ sender: Any) {
        if let path = Uncrustify.userConfigPath(createDirectoryIfAbsent: true) {
            NSWorkspace.shared.selectFile(path, inFileViewerRootedAtPath: "")
        }
    }

    @IBAction func uncrustifyReset(_ sender: Any) {
        Uncrustify.resetConfigToDefault()
    }

    @IBAction func uncrustifyView(_ sender: Any) {
        if let url = Uncrustify.websiteURL {
            NSWorkspace.shared.open(url)
        }
    }
}
