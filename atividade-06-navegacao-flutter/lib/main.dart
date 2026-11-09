import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação IFPI',
      initialRoute: '/',
      routes: {
        '/': (context) => const PrimeiraPagina(),
        '/segunda': (context) => const SegundaPagina(),
      },
    );
  }
}

class PrimeiraPagina extends StatelessWidget {
  const PrimeiraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeira Página')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // push: abre uma nova página.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SegundaPagina(),
                  ),
                );
              },
              child: const Text('Abrir com push()'),
            ),
            ElevatedButton(
              onPressed: () {
                // pushNamed: abre uma página por seu nome de rota.
                Navigator.pushNamed(context, '/segunda');
              },
              child: const Text('Abrir com rota nomeada'),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  const SegundaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Página')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // pop: volta para a página anterior.
            Navigator.pop(context);
          },
          child: const Text('Voltar com pop()'),
        ),
      ),
    );
  }
}
