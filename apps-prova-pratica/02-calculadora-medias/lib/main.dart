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
      home: TelaMedia(),
    );
  }
}

class TelaMedia extends StatefulWidget {
  const TelaMedia({super.key});

  @override
  State<TelaMedia> createState() => _TelaMediaState();
}

class _TelaMediaState extends State<TelaMedia> {
  // Um controlador para cada campo de nota.
  final primeiraNota = TextEditingController();
  final segundaNota = TextEditingController();

  String resultado = '';

  void calcularMedia() {
    // Troca a vírgula por ponto para aceitar os dois formatos.
    final n1 = double.tryParse(primeiraNota.text.replaceAll(',', '.'));
    final n2 = double.tryParse(segundaNota.text.replaceAll(',', '.'));

    // Confere se foram digitados números entre 0 e 10.
    if (n1 == null || n2 == null || n1 < 0 || n1 > 10 || n2 < 0 || n2 > 10) {
      setState(() {
        resultado = 'Digite duas notas válidas entre 0 e 10.';
      });
      return;
    }

    final media = (n1 + n2) / 2;
    final situacao = media >= 7 ? 'Aprovado' : 'Abaixo da média';

    // setState faz o resultado aparecer na interface.
    setState(() {
      resultado = 'Média: ${media.toStringAsFixed(1)}\nSituação: $situacao';
    });
  }

  @override
  void dispose() {
    primeiraNota.dispose();
    segundaNota.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Médias'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.school, size: 70, color: Colors.blue),
              const SizedBox(height: 20),
              TextField(
                controller: primeiraNota,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Primeira nota',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: segundaNota,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Segunda nota',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularMedia,
                child: const Text('Calcular média'),
              ),
              const SizedBox(height: 20),
              if (resultado.isNotEmpty)
                Text(
                  resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
