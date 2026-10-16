import LooperCore
import SwiftUI

@main
struct LooperApp: App {
    var body: some Scene {
        MenuBarExtra("Looper", systemImage: "square.grid.2x2") {
            Button("Quit Looper") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
    }
}
