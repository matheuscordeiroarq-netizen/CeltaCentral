import SwiftUI

struct CarVisual: View {
    @EnvironmentObject var vehicle: VehicleController

    var body: some View {
        ZStack {
            Ellipse()
                .fill(.black.opacity(0.10))
                .frame(width: 540, height: 76)
                .blur(radius: 13)
                .offset(y: 118)

            if vehicle.acOn {
                ForEach(0..<4, id: \.self) { i in
                    Capsule()
                        .fill(.cyan.opacity(0.18))
                        .frame(width: 18, height: 125)
                        .blur(radius: 2)
                        .rotationEffect(.degrees(Double(i - 2) * 8))
                        .offset(x: CGFloat(i - 2) * 34, y: -38)
                        .transition(.opacity)
                }
            }

            // Representação vetorial simples do Celta para evitar depender de imagem externa.
            ZStack {
                RoundedRectangle(cornerRadius: 62)
                    .fill(LinearGradient(colors: [.white, .gray.opacity(0.38)],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 510, height: 190)
                    .overlay(
                        RoundedRectangle(cornerRadius: 62)
                            .stroke(.white.opacity(0.9), lineWidth: 2)
                    )

                RoundedRectangle(cornerRadius: 42)
                    .fill(.black.opacity(0.72))
                    .frame(width: 250, height: 92)
                    .offset(x: -18, y: -63)

                HStack(spacing: 350) {
                    Circle().fill(.black).frame(width: 92, height: 92)
                    Circle().fill(.black).frame(width: 92, height: 92)
                }
                .offset(y: 84)

                HStack(spacing: 330) {
                    Circle().fill(.gray.opacity(0.65)).frame(width: 48, height: 48)
                    Circle().fill(.gray.opacity(0.65)).frame(width: 48, height: 48)
                }
                .offset(y: 84)

                if vehicle.fogOn {
                    HStack(spacing: 300) {
                        Circle().fill(.yellow.opacity(0.9)).frame(width: 24, height: 24)
                            .shadow(color: .yellow, radius: 25)
                        Circle().fill(.yellow.opacity(0.9)).frame(width: 24, height: 24)
                            .shadow(color: .yellow, radius: 25)
                    }
                    .offset(y: 33)
                    .transition(.opacity)
                }

                if vehicle.unlockFlash {
                    RoundedRectangle(cornerRadius: 62)
                        .stroke(.orange.opacity(0.95), lineWidth: 10)
                        .frame(width: 525, height: 205)
                        .shadow(color: .orange, radius: 20)
                        .transition(.opacity)
                }

                if vehicle.trunkOpen {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.white)
                        .frame(width: 150, height: 20)
                        .rotationEffect(.degrees(-34), anchor: .leading)
                        .offset(x: 220, y: -84)
                        .shadow(radius: 5)
                        .transition(.scale.combined(with: .opacity))
                }

                Text("CELTA")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.52))
                    .offset(x: 154, y: 12)
            }
            .scaleEffect(vehicle.unlockFlash ? 1.015 : 1)
        }
    }
}
