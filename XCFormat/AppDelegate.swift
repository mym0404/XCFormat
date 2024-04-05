import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Uncrustify.appDidLaunch()
    }

//    func applicationWillTerminate(_ aNotification: Notification) {
//        // Insert code here to tear down your application
//    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}
