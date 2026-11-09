import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos IFPI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const TelaContatos(),
    );
  }
}

class TelaContatos extends StatefulWidget {
  const TelaContatos({super.key});

  @override
  State<TelaContatos> createState() => _TelaContatosState();
}

class _TelaContatosState extends State<TelaContatos> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  Database? banco;
  List<Map<String, Object?>> contatos = [];
  int? idEditando;
  String mensagem = '';

  @override
  void initState() {
    super.initState();
    abrirBanco();
  }

  Future<void> abrirBanco() async {
    // Descobre onde o Android guarda os bancos do aplicativo.
    String pasta = await getDatabasesPath();
    String caminho = join(pasta, 'contatos.db');

    Database db = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(
          'CREATE TABLE contatos ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'nome TEXT NOT NULL, '
          'email TEXT NOT NULL)',
        );
      },
    );

    if (!mounted) {
      await db.close();
      return;
    }
    banco = db;
    await listarContatos();
  }

  Future<void> listarContatos() async {
    if (banco == null) return;
    List<Map<String, Object?>> lista =
        await banco!.query('contatos', orderBy: 'nome ASC');

    if (!mounted) return;
    setState(() {
      contatos = lista;
    });
  }

  Future<void> salvarContato() async {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();

    if (nome.isEmpty || email.isEmpty || banco == null) {
      setState(() => mensagem = 'Informe nome e e-mail.');
      return;
    }

    Map<String, Object?> dados = {
      'nome': nome,
      'email': email,
    };

    if (idEditando == null) {
      // INSERT: adiciona um novo contato.
      await banco!.insert('contatos', dados);
    } else {
      // UPDATE: altera um contato que já existe.
      await banco!.update(
        'contatos',
        dados,
        where: 'id = ?',
        whereArgs: [idEditando],
      );
    }

    nomeController.clear();
    emailController.clear();
    if (!mounted) return;
    setState(() {
      idEditando = null;
      mensagem = 'Contato salvo!';
    });
    await listarContatos();
  }

  void editarContato(Map<String, Object?> contato) {
    // Coloca os dados nos campos para que sejam alterados.
    nomeController.text = contato['nome'] as String;
    emailController.text = contato['email'] as String;
    setState(() {
      idEditando = contato['id'] as int;
      mensagem = 'Editando contato';
    });
  }

  Future<void> excluirContato(int id) async {
    if (banco == null) return;
    // DELETE: remove o registro com o id informado.
    await banco!.delete(
      'contatos',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (!mounted) return;
    if (idEditando == id) {
      nomeController.clear();
      emailController.clear();
    }
    setState(() {
      if (idEditando == id) idEditando = null;
      mensagem = 'Contato excluído.';
    });
    await listarContatos();
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    // O banco pode ser liberado quando não for mais usado.
    banco?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Contatos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: salvarContato,
              child: Text(idEditando == null ? 'Salvar' : 'Atualizar'),
            ),
            if (mensagem.isNotEmpty) Text(mensagem),
            const Divider(),
            const Text('Contatos cadastrados'),
            Expanded(
              child: ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (context, indice) {
                  var contato = contatos[indice];
                  int id = contato['id'] as int;
                  return ListTile(
                    title: Text(contato['nome'] as String),
                    subtitle: Text(contato['email'] as String),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          tooltip: 'Editar',
                          onPressed: () => editarContato(contato),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          tooltip: 'Excluir',
                          onPressed: () => excluirContato(id),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
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
