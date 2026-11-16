import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

// Classe que representa uma tarefa da lista.
class Tarefa {
  String nome;
  bool concluida;

  Tarefa(this.nome, {this.concluida = false});
}

// Ponto de entrada visual do aplicativo.
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaTarefas(),
    );
  }
}

// StatefulWidget permite atualizar a lista na tela.
class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  // Controla o texto digitado no campo.
  final controlador = TextEditingController();

  // Lista inicial de tarefas.
  final List<Tarefa> tarefas = [
    Tarefa('Estudar Flutter'),
    Tarefa('Revisar Dart'),
    Tarefa('Fazer a atividade prática'),
  ];

  void adicionarTarefa() {
    final texto = controlador.text.trim();

    if (texto.isEmpty) {
      return; // Não adiciona tarefas vazias.
    }

    setState(() {
      tarefas.add(Tarefa(texto));
      controlador.clear();
    });
  }

  @override
  void dispose() {
    controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final concluidas = tarefas.where((t) => t.concluida).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Lista de Tarefas'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Concluídas: $concluidas de ${tarefas.length}'),
            const SizedBox(height: 16),
            TextField(
              controller: controlador,
              decoration: const InputDecoration(
                labelText: 'Nova tarefa',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => adicionarTarefa(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 16),
            // Expanded deixa a lista ocupar o espaço disponível.
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, indice) {
                  final tarefa = tarefas[indice];

                  return CheckboxListTile(
                    title: Text(tarefa.nome),
                    value: tarefa.concluida,
                    onChanged: (valor) {
                      setState(() {
                        tarefa.concluida = valor ?? false;
                      });
                    },
                    secondary: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Excluir tarefa',
                      onPressed: () {
                        setState(() {
                          tarefas.removeAt(indice);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
