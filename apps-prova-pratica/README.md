# Aplicativos Flutter para treinar a prova prática

Três projetos iniciais **independentes**, construídos com os conteúdos vistos nas aulas de Programação para Dispositivos Móveis. Não são cópias de enunciados do professor; são **ideias de aplicativos originais para praticar**.

| Aplicativo | Conceitos usados | Código para copiar |
|---|---|---|
| [1. Minha Lista de Tarefas](01-lista-tarefas/README.md) | `TextField`, `ListView.builder`, `CheckboxListTile`, `setState` | [main.dart](01-lista-tarefas/lib/main.dart) |
| [2. Calculadora de Médias](02-calculadora-medias/README.md) | dois `TextField`, `tryParse`, `if`, botão, `setState` | [main.dart](02-calculadora-medias/lib/main.dart) |
| [3. Meu Guia de Estudos](03-navegacao-telas/README.md) | `StatelessWidget`, `ListTile`, duas telas, `Navigator.push/pop` | [main.dart](03-navegacao-telas/lib/main.dart) |


> **Atividade prática recebida em 16/11/2026:** [App 4 — Food Explorer (seis cards e BottomNavigationBar)](04-guia-gastronomico/README.md) — [copiar main.dart](04-guia-gastronomico/lib/main.dart).

## Como rodar — do zero

**Opção A: FlutLab (mais simples para copiar e colar)**

1. Crie um projeto novo Flutter no FlutLab.
2. Abra o arquivo `lib/main.dart`.
3. Apague o conteúdo e cole o `lib/main.dart` de **um** dos três aplicativos.
4. Clique em **Run**. Repita em um projeto diferente para cada app.

**Opção B: computador com Flutter instalado (Linux Ubuntu, Windows ou macOS)**

Cada subpasta contém um `pubspec.yaml` e o arquivo `lib/main.dart`, mas não inclui as pastas de plataforma geradas pelo Flutter. Para executar no Chrome:

```bash
cd apps-prova-pratica/01-lista-tarefas
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

Para os outros apps, volte à pasta `apps-prova-pratica` e entre em `02-calculadora-medias` ou `03-navegacao-telas`. A pasta de trabalho correta sempre contém `pubspec.yaml`.

Se o Chrome apresentar problema de depuração:

```bash
flutter run -d web-server --web-port=8080
```

Abra `http://localhost:8080` manualmente. Você também pode criar um projeto do zero com `flutter create nome_do_projeto` e substituir só o `lib/main.dart`.

## Guia de estudos dos três códigos

### Primeiro: entenda a estrutura que se repete

```dart
import 'package:flutter/material.dart'; // importa os widgets
void main() => runApp(const MeuApp());   // inicia o aplicativo
```

- `MaterialApp`: configura o aplicativo.
- `Scaffold`: estrutura uma página, com `appBar` e `body`.
- `AppBar`: título e barra superior.
- `Text`: mostra texto; `Icon`: mostra ícone.
- `Column`: organiza widgets verticalmente; `ListView`: cria uma lista rolável.

### App 1: quando escolher StatefulWidget?

Se a informação **muda na tela**, por exemplo, ao adicionar ou marcar uma tarefa, use um `StatefulWidget`. Nele, `setState(() { ... })` faz a interface refletir a mudança.

```dart
setState(() {
  tarefas.add(Tarefa('Ler slides'));
});
```

- `tarefas` é uma lista de objetos do tipo `Tarefa`.
- `CheckboxListTile` mostra e altera o valor `bool` (verdadeiro/falso).
- `ListView.builder` monta os itens conforme `itemCount`.

### App 2: como um TextField vira um cálculo?

```dart
final nota = TextEditingController();
final valor = double.tryParse(nota.text.replaceAll(',', '.'));
```

- `TextEditingController`: lê o texto que a pessoa digitou.
- `.text`: obtém esse texto.
- `double.tryParse`: converte texto em número (ou devolve `null`).
- `if`: verifica as condições, evitando notas inválidas.
- `onPressed: calcularMedia`: executa a função no clique; `Text(resultado)` mostra a resposta.

**Exemplo:** nota 8 e nota 6 → média 7. A regra de aprovação deste app foi definida só para treino.

### App 3: como ir de uma página para a outra?

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const TelaInicial()),
);
```

- `Navigator.push`: empilha uma nova tela.
- `Navigator.pop(context)`: fecha a tela atual e volta.
- `onTap`: executa a ação ao tocar em uma linha.
- `required`: indica que determinado parâmetro precisa ser fornecido no construtor.

**Atenção:** o trecho de navegação acima é apenas ilustrativo; no código completo, a primeira tela abre `TelaDetalhes`, não ela mesma.

## Roteiro rápido para revisar antes da prova

1. **10 minutos — App 1:** encontre onde se cria uma tarefa, onde está o `setState` e como funciona o checkbox.
2. **10 minutos — App 2:** encontre `TextField`, controladores, conversão de texto e fórmula da média.
3. **10 minutos — App 3:** encontre o `Navigator.push`, os parâmetros da tela de detalhes e o `Navigator.pop`.
4. **10 minutos — treino sem copiar:** troque um título, uma cor, um texto de botão e adicione um item à lista.
5. **5 minutos — explicação oral:** diga para que serve cada widget principal.

## Perguntas que podem ajudar durante a demonstração

| Se o professor perguntar... | Responda assim |
|---|---|
| Por que usou `StatefulWidget`? | Porque existem informações que mudam durante o uso do app. |
| Para que serve `setState()`? | Para o Flutter atualizar a interface após uma mudança no estado. |
| O que faz `TextEditingController`? | Permite ler o que foi digitado em um `TextField`. |
| Por que usou `tryParse`? | Para converter o texto em número sem lançar exceção por texto inválido. |
| Como a lista é construída? | `ListView.builder` percorre a lista e cria cada item. |
| Como abre a segunda tela? | Com `Navigator.push` e `MaterialPageRoute`. |
| Como volta à tela anterior? | Com `Navigator.pop(context)`. |

## Checklist antes de apresentar

- [ ] Escolhi apenas um projeto por vez, sem misturar três arquivos `main.dart`.
- [ ] Testei a interface e os botões no FlutLab ou Flutter.
- [ ] Testei valores inválidos na calculadora.
- [ ] Sei apontar o widget e a função responsáveis pelo que o aplicativo faz.
- [ ] Tenho o link do GitHub correto.

**Observação:** o código foi revisado estruturalmente, mas não foi compilado no ambiente desta criação. Faça um teste real antes de entregar. Não confunda esses três exemplos com uma exigência de entregar três aplicativos: confirme o enunciado que o professor passou.

Voltar ao [guia anterior de estudos](../guia-de-estudos/README.md).
