# Celta Central — iPad

Protótipo nativo em SwiftUI para uma central multimídia do Chevrolet Celta, desenhada para iPad em orientação horizontal.

## Incluído nesta versão
- Home clara inspirada na organização visual de centrais automotivas modernas.
- Relógio e status do módulo no topo.
- Atalho CarPlay.
- Barra inferior permanente com:
  - Home
  - A/C (liga/desliga)
  - Farol de milha (liga/desliga)
  - Módulo de som (liga/desliga)
  - Destravar portas (pulso)
  - Porta-malas (pulso)
- Animações visuais do carro para milha, A/C, portas e porta-malas.
- Modo demonstração sem hardware.
- Arquitetura pronta para substituir o serviço de demonstração por Bluetooth BLE.
- Tela CarPlay de integração futura. Ela não finge ser CarPlay oficial: iPadOS não fornece API pública para transformar um app comum em receptor CarPlay.

## Estrutura
Abra `CeltaCentral.xcodeproj` em um ambiente macOS/Xcode quando for compilar para iPad. Os fontes SwiftUI estão em `CeltaCentral/`.

## Hardware
Os comandos reais do carro devem ser feitos por um módulo automotivo devidamente protegido (por exemplo BLE + microcontrolador + drivers/relés/optocopladores apropriados). O iPad nunca deve alimentar diretamente faróis, compressor, trava ou módulo de som.

## Instalação sem Mac
O projeto-fonte está pronto, mas um IPA instalável precisa ser compilado e assinado por ferramentas Apple. A etapa de build/assinatura pode ser feita posteriormente em um serviço de CI macOS compatível ou outro ambiente Apple. As opções gratuitas mudam com frequência, então confirme as condições atuais antes de escolher uma.
