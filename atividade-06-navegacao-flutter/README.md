# Atividade 06 — Navegação entre páginas

Baseada na página 11 dos slides **Flutter — Navigation**.

## O pedido
1. Criar duas páginas;
2. Usar `Navigator.push()` para avançar e `Navigator.pop()` para voltar;
3. Mostrar o título da página em cada `AppBar`;
4. Modificar o código para também utilizar rotas nomeadas.

Os **dois botões da primeira página** demonstram as duas maneiras de abrir a segunda tela.

## Rodar
```bash
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

## Para explicar
`Navigator` controla uma pilha de páginas. `push` coloca uma nova tela na pilha, `pop` remove a tela atual, e `pushNamed` navega usando um nome registrado em `routes`.
