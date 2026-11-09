import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App', // Nome interno solicitado na aula.
      debugShowCheckedModeBanner: false, // Retira a tarja DEBUG.
      theme: ThemeData(
        colorSchemeSeed: Colors.green, // Cor escolhida para o tema.
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int contador = 0;

  void aumentarContador() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você apertou o botão esta quantidade de vezes:'),
            Text('$contador', style: const TextStyle(fontSize: 36)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: aumentarContador,
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
