import SwiftUI

enum MainScreen {
    case home
    case carPlay
}

@MainActor
final class VehicleController: ObservableObject {
    @Published var screen: MainScreen = .home
    @Published var acOn = false
    @Published var fogOn = false
    @Published var amplifierOn = false
    @Published var trunkOpen = false
    @Published var unlockFlash = false
    @Published var demoMode = true
    @Published var bluetoothConnected = false
    @Published var toast: String?

    func toggleAC() {
        acOn.toggle()
        send("AC:\(acOn ? "ON" : "OFF")")
    }

    func toggleFog() {
        fogOn.toggle()
        send("FOG:\(fogOn ? "ON" : "OFF")")
    }

    func toggleAmplifier() {
        amplifierOn.toggle()
        send("AMP:\(amplifierOn ? "ON" : "OFF")")
    }

    func unlockDoors() {
        send("UNLOCK:PULSE")
        toast = "Portas destravadas"
        withAnimation(.easeInOut(duration: 0.18)) { unlockFlash = true }
        Task {
            try? await Task.sleep(for: .milliseconds(650))
            withAnimation(.easeInOut(duration: 0.18)) { self.unlockFlash = false }
            try? await Task.sleep(for: .milliseconds(800))
            self.toast = nil
        }
    }

    func pulseTrunk() {
        send("TRUNK:PULSE")
        toast = "Porta-malas acionado"
        withAnimation(.spring(response: 0.45, dampingFraction: 0.75)) { trunkOpen = true }
        Task {
            try? await Task.sleep(for: .seconds(2.2))
            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) { self.trunkOpen = false }
            self.toast = nil
        }
    }

    private func send(_ command: String) {
        // DEMO: este é o ponto de integração com BLE.
        // Substituir por BluetoothService.write(command) quando o hardware for definido.
        print("[Vehicle] \(command)")
    }
}
