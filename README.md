# IFPI — Mapa e Geolocalização

Aplicativo Flutter para a disciplina de Programação para Dispositivos Móveis do IFPI.

## Funcionalidades
- Mapa interativo com **OpenStreetMap** (sem API key do Google e sem cadastro de cartão).
- Marcadores para **IFPI Teresina Central** e **IFPI Teresina Zona Sul** (coordenadas aproximadas).
- Geolocalização mediante permissão do navegador/dispositivo.
- Seta azul indicando a posição informada pelo navegador, em estilo de navegação (não gira automaticamente conforme a direção).
- Círculo que representa a precisão estimada, em metros.
- Ajuste manual de posição ao selecionar o botão de edição e tocar no mapa.
- Marcadores adicionais ao tocar no mapa fora do modo de ajuste.
- Botões de centralização nos dois campi.

## Como executar no Ubuntu com Chrome

Instale o Flutter SDK e abra a pasta do projeto no VS Code. No terminal:

```bash
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

A pasta `web/` é gerada pelo Flutter com o comando acima. Se quiser executar no Android ou iOS, crie as plataformas correspondentes e configure as permissões de localização conforme a documentação do pacote `geolocator`.

## Sobre a localização
O navegador pode estimar a posição por Wi-Fi/IP e apresentar margem de erro de centenas ou milhares de metros. A seta representa a **posição estimada**, não o rumo real do aparelho. Para ajustar manualmente, clique no botão de edição e escolha o ponto no mapa.

## Tecnologias
- Flutter / Dart
- [flutter_map](https://pub.dev/packages/flutter_map)
- [geolocator](https://pub.dev/packages/geolocator)
- [latlong2](https://pub.dev/packages/latlong2)
- [OpenStreetMap](https://www.openstreetmap.org)

**Nota para avaliação:** a atividade original solicita Google Maps; esta versão usa OpenStreetMap para evitar a exigência de faturamento no Google Cloud. Consulte o professor sobre aceitar esta alternativa.

Dados do mapa: © OpenStreetMap contributors. Ao publicar ou disponibilizar o app amplamente, confira a [política de uso dos tiles](https://operations.osmfoundation.org/policies/tiles/).
