import SwiftUI

struct CarPlayView: View {
    @EnvironmentObject var vehicle: VehicleController

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black.opacity(0.88), .gray.opacity(0.82)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                HStack {
                    Button {
                        vehicle.screen = .home
                    } label: {
                        Label("Voltar", systemImage: "chevron.left")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(.white.opacity(0.12), in: Capsule())
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.white)

                    Spacer()

                    Text("CarPlay")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.white)

                    Spacer()
                    Color.clear.frame(width: 92)
                }

                Spacer()

                Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                    .font(.system(size: 72))
                    .foregroundStyle(.white)

                Text("Receptor CarPlay não configurado")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white)

                Text("Esta área está reservada para a futura integração com um receptor/hardware compatível. O iPad não oferece uma API pública para um app comum atuar como receptor do CarPlay oficial.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white.opacity(0.78))
                    .frame(maxWidth: 680)

                Text("Os controles do carro continuam disponíveis na barra inferior.")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white.opacity(0.72))

                Spacer()
            }
            .padding(34)
        }
    }
}
