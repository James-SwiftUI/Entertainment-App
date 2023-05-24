import SwiftUI

@main
struct Entertainment_AppApp: App {
    
    @StateObject var vm = EntertainmentViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabbedView()
                .environmentObject(vm)
        }
    }
}
