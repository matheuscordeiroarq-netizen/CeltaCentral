import SwiftUI

struct RootView: View {
    @EnvironmentObject var vehicle: VehicleController

    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(
                colors: [Color(red: 0.92, green: 0.96, blue: 0.99),
                         Color(red: 0.78, green: 0.88, blue: 0.94)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Group {
                switch vehicle.screen {
                case .home: HomeView()
                case .carPlay: CarPlayView()
                }
            }
            .padding(.bottom, 104)

            BottomVehicleBar()

            if let toast = vehicle.toast {
                Text(toast)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 22)
                    .padding(.vertical, 12)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding(.bottom, 122)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.25), value: vehicle.toast)
    }
}
