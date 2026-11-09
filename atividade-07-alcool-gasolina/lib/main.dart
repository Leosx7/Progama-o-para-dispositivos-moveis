import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool e Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const TelaCombustivel(),
    );
  }
}

class TelaCombustivel extends StatefulWidget {
  const TelaCombustivel({super.key});

  @override
  State<TelaCombustivel> createState() => _TelaCombustivelState();
}

class _TelaCombustivelState extends State<TelaCombustivel> {
  final controladorAlcool = TextEditingController();
  final controladorGasolina = TextEditingController();

  String resultado = ''; // Começa vazio: só aparece após o botão.

  void calcular() {
    double? alcool = double.tryParse(
      controladorAlcool.text.replaceAll(',', '.'),
    );
    double? gasolina = double.tryParse(
      controladorGasolina.text.replaceAll(',', '.'),
    );

    if (alcool == null || gasolina == null || alcool <= 0 || gasolina <= 0) {
      setState(() {
        resultado = 'Digite dois preços válidos maiores que zero.';
      });
      return;
    }

    double porcentagem = alcool / gasolina * 100;

    // Esta comparação segue literalmente o slide do professor.
    String escolha;
    if (porcentagem >= 70) {
      escolha = 'Álcool';
    } else {
      escolha = 'Gasolina';
    }

    setState(() {
      resultado =
          'Resultado: ${porcentagem.toStringAsFixed(1)}%\nAbastecer com: $escolha';
    });
  }

  @override
  void dispose() {
    controladorAlcool.dispose();
    controladorGasolina.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gasolina x Álcool')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_gas_station,
                    color: Colors.green, size: 90),
                const SizedBox(height: 20),
                TextField(
                  controller: controladorAlcool,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Valor do álcool',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controladorGasolina,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Valor da gasolina',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 20),
                if (resultado.isNotEmpty)
                  Text(resultado, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
