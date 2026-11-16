# App 1 — Minha Lista de Tarefas

**Nível:** iniciante. **Arquivo para copiar:** [lib/main.dart](lib/main.dart).

## O que o aplicativo faz
- Mostra três tarefas iniciais.
- Permite digitar e adicionar uma tarefa.
- Permite marcar e desmarcar tarefas com checkbox.
- Exclui uma tarefa com o ícone de lixeira.
- Mostra quantas foram concluídas.

## O que você vai aprender
- `TextEditingController`: lê o texto do campo.
- `TextField`: exibe a caixa para digitar.
- `List<Tarefa>`: guarda as tarefas.
- `ListView.builder`: constrói uma linha para cada tarefa.
- `CheckboxListTile`: une texto e caixa de seleção.
- `setState()`: reconstrói a tela depois de adicionar, marcar ou excluir.
- `onPressed` e `onChanged`: respondem a ações da pessoa.

## Trechos para entender
```dart
final texto = controlador.text.trim(); // pega o texto e remove espaços extras
tarefas.add(Tarefa(texto));            // adiciona à lista
```

```dart
setState(() {
  tarefa.concluida = valor ?? false; // altera o checkbox e atualiza a tela
});
```

## Possíveis alterações pedidas na prova
1. Trocar o título para **Lista de Estudos**: altere o `AppBar`.
2. Adicionar uma tarefa inicial: coloque outro `Tarefa('Nome')` na lista.
3. Mudar a cor do aplicativo: altere `backgroundColor`.
4. Impedir textos vazios: observe o `if (texto.isEmpty)` já implementado.

**Explique ao professor:** usamos `StatefulWidget` porque a lista e os checkboxes mudam enquanto o app está aberto. Os dados ficam em memória e desaparecem ao reiniciar.
