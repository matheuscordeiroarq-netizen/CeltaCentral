import SwiftUI

struct BottomVehicleBar: View {
    @EnvironmentObject var vehicle: VehicleController

    var body: some View {
        HStack(spacing: 4) {
            BarButton(icon: "house.fill", title: "Home",
                      active: vehicle.screen == .home) {
                vehicle.screen = .home
            }

            Divider().frame(height: 48)

            BarButton(icon: "snowflake", title: "A/C", active: vehicle.acOn) {
                vehicle.toggleAC()
            }
            BarButton(icon: "lightbulb.max.fill", title: "Milha", active: vehicle.fogOn) {
                vehicle.toggleFog()
            }
            BarButton(icon: "speaker.wave.3.fill", title: "Módulo", active: vehicle.amplifierOn) {
                vehicle.toggleAmplifier()
            }
            BarButton(icon: "lock.open.fill", title: "Destravar", active: false) {
                vehicle.unlockDoors()
            }
            BarButton(icon: "car.rear.and.tire.marks", title: "Porta-malas", active: vehicle.trunkOpen) {
                vehicle.pulseTrunk()
            }
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .frame(height: 96)
        .background(.ultraThinMaterial)
        .overlay(alignment: .top) { Divider() }
    }
}

struct BarButton: View {
    let icon: String
    let title: String
    let active: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 7) {
                Image(systemName: icon)
                    .font(.system(size: 25, weight: .medium))
                Text(title)
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundStyle(active ? .blue : .primary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(active ? Color.blue.opacity(0.10) : .clear,
                        in: RoundedRectangle(cornerRadius: 18))
        }
        .buttonStyle(.plain)
    }
}
