import Foundation
import CoreBluetooth

/// Esqueleto para a integração BLE real.
/// O UUID e o protocolo serão definidos quando o módulo eletrônico do carro for escolhido.
final class BluetoothService: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    private var central: CBCentralManager!

    override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // Quando houver hardware definido, iniciar scan apenas no estado .poweredOn.
    }

    func peripheral(_ peripheral: CBPeripheral,
                    didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
        // Futuro retorno de estado real do veículo.
    }
}
