# Atividade 05 — ListView.builder com checkbox

Baseada na página 8 dos slides **Flutter — ListView** (os dois PDFs enviados desse tema são iguais).

## O pedido
Usar `onChanged` e `setState()` para que a marcação de cada checkbox mude quando o usuário clicar nele.

## Rodar
```bash
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

## Para explicar
- `Item`: classe com nome e situação da marcação.
- `List<Item>`: armazena os produtos.
- `ListView.builder`: cria visualmente uma linha por item.
- `CheckboxListTile`: linha contendo texto e caixa de seleção.
- `onChanged`: é chamado ao clicar.
- `setState`: atualiza a interface depois da alteração.
