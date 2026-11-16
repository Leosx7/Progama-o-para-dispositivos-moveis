# App 3 — Meu Guia de Estudos (duas telas)

**Nível:** iniciante. **Arquivo para copiar:** [lib/main.dart](lib/main.dart).

## O que o aplicativo faz
A primeira tela apresenta três temas: Dart, Flutter e Mapas. Ao tocar em um tema, abre outra tela com uma explicação e botão **Voltar**.

## O que você aprende
- `StatelessWidget`: a tela não precisa controlar uma informação mutável local.
- `Scaffold`, `AppBar`, `ListView`, `ListTile`.
- `onTap`: é chamado quando a pessoa toca uma linha.
- `Navigator.push`: abre outra página.
- `MaterialPageRoute`: define qual tela será aberta.
- `Navigator.pop`: volta para a página anterior.
- `required this.assunto`: exige que o valor seja informado ao abrir `TelaDetalhes`.

## Entenda a navegação
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TelaDetalhes(
      assunto: 'Dart',
      explicacao: 'Linguagem de programação',
    ),
  ),
);
```
Esse trecho abre a tela `TelaDetalhes` e envia dois textos.

```dart
Navigator.pop(context);
```
Esse trecho fecha a página atual e volta para a anterior.

## Possíveis mudanças na prova
1. Trocar os nomes dos temas.
2. Criar um quarto tema com outro `ListTile`.
3. Modificar o texto de uma explicação.
4. Mudar a cor do `AppBar`.

**Explique ao professor:** o app mostra duas telas diferentes e passa informações de uma para a outra pelo construtor.
