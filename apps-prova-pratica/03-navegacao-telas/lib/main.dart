import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

// Primeira tela: uma lista de assuntos para estudar.
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  void abrirDetalhes(BuildContext context, String assunto, String explicacao) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDetalhes(
          assunto: assunto,
          explicacao: explicacao,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Guia de Estudos'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Escolha um assunto para visualizar:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Dart'),
            subtitle: const Text('Linguagem de programação'),
            onTap: () => abrirDetalhes(
              context,
              'Dart',
              'Dart é a linguagem utilizada para programar aplicativos Flutter.',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('Flutter'),
            subtitle: const Text('Interface com widgets'),
            onTap: () => abrirDetalhes(
              context,
              'Flutter',
              'Flutter permite construir telas usando widgets como Text, Row e Column.',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Mapas'),
            subtitle: const Text('Latitude, longitude e marcadores'),
            onTap: () => abrirDetalhes(
              context,
              'Mapas',
              'Um marcador é colocado no mapa em coordenadas de latitude e longitude.',
            ),
          ),
        ],
      ),
    );
  }
}

// Segunda tela: recebe o título e a explicação da primeira tela.
class TelaDetalhes extends StatelessWidget {
  final String assunto;
  final String explicacao;

  const TelaDetalhes({
    super.key,
    required this.assunto,
    required this.explicacao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(assunto),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                explicacao,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
