import SwiftUI

@main
struct CeltaCentralApp: App {
    @StateObject private var vehicle = VehicleController()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(vehicle)
                .preferredColorScheme(.light)
        }
    }
}
