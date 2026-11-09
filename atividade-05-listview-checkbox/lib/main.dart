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
      title: 'Lista de Compras',
      home: const TelaCompras(),
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
    );
  }
}

class Item {
  String nome;
  bool marcado;

  Item(this.nome, this.marcado);
}

class TelaCompras extends StatefulWidget {
  const TelaCompras({super.key});

  @override
  State<TelaCompras> createState() => _TelaComprasState();
}

class _TelaComprasState extends State<TelaCompras> {
  List<Item> itens = [
    Item('Arroz', true),
    Item('Feijão', false),
    Item('Farinha', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras')),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, indice) {
          Item item = itens[indice];

          return CheckboxListTile(
            title: Text(item.nome),
            value: item.marcado,
            onChanged: (bool? novoValor) {
              // setState faz a tela ser atualizada.
              setState(() {
                item.marcado = novoValor ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
