# Atividade 04 — Primeiro programa Flutter

Baseada na página 8 do material **Flutter — Primeiro Programa**.

Alterações solicitadas: tema verde, título da AppBar **Home**, remoção da tarja DEBUG, frase em português e nome interno **Meu App**.

## Como executar
Na pasta desta atividade:
```bash
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

**Para explicar:** `MaterialApp` configura o aplicativo; `Scaffold` organiza a tela; `AppBar` mostra o título; `StatefulWidget` guarda o contador; `setState` atualiza o número quando o botão é pressionado.
