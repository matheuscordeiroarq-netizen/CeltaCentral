import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vehicle: VehicleController
    @State private var now = Date()

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("CELTA")
                        .font(.system(size: 21, weight: .semibold))
                    HStack(spacing: 7) {
                        Circle()
                            .fill(vehicle.bluetoothConnected ? .green : .orange)
                            .frame(width: 8, height: 8)
                        Text(vehicle.demoMode ? "Modo demonstração" :
                                (vehicle.bluetoothConnected ? "Módulo conectado" : "Módulo desconectado"))
                            .font(.system(size: 14))
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                Text(now, style: .time)
                    .font(.system(size: 54, weight: .light, design: .rounded))
                    .monospacedDigit()

                Spacer()

                Button {
                    vehicle.screen = .carPlay
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "car.side.fill")
                            .font(.system(size: 28))
                        Text("CarPlay")
                            .font(.system(size: 15, weight: .medium))
                    }
                    .frame(width: 104, height: 78)
                    .background(.white.opacity(0.55), in: RoundedRectangle(cornerRadius: 24))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 42)
            .padding(.top, 24)

            Spacer(minLength: 4)

            CarVisual()
                .frame(maxWidth: 760, maxHeight: 410)
                .padding(.horizontal, 30)

            Spacer(minLength: 0)

            HStack(spacing: 18) {
                StatusPill(icon: "snowflake", title: "A/C", active: vehicle.acOn)
                StatusPill(icon: "lightbulb.max.fill", title: "Milha", active: vehicle.fogOn)
                StatusPill(icon: "speaker.wave.3.fill", title: "Som", active: vehicle.amplifierOn)
            }
            .padding(.bottom, 8)
        }
        .task {
            while !Task.isCancelled {
                now = Date()
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
}

struct StatusPill: View {
    let icon: String
    let title: String
    let active: Bool

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
            Text(active ? "ON" : "OFF")
                .fontWeight(.semibold)
        }
        .font(.system(size: 15))
        .padding(.horizontal, 16)
        .padding(.vertical, 9)
        .background(active ? Color.white.opacity(0.82) : Color.white.opacity(0.38),
                    in: Capsule())
        .opacity(active ? 1 : 0.7)
    }
}
