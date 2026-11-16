import 'package:flutter/material.dart';

void main() {
  runApp(const GuiaGastronomicoApp());
}

// App com Material Design e sem a faixa vermelha DEBUG.
class GuiaGastronomicoApp extends StatelessWidget {
  const GuiaGastronomicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFC83D)),
      ),
      home: const TelaPrincipal(),
    );
  }
}

// Cada card guarda um titulo, os icones e uma descricao.
class Categoria {
  final String titulo;
  final String emoji;
  final String descricao;
  final Color cor;

  const Categoria({
    required this.titulo,
    required this.emoji,
    required this.descricao,
    required this.cor,
  });
}

const categorias = <Categoria>[
  Categoria(
    titulo: 'Bars & Hotels',
    emoji: '🍺',
    descricao: 'Descubra lugares para tomar uma bebida e relaxar.',
    cor: Color(0xFFFFE1C4),
  ),
  Categoria(
    titulo: 'Fine Dining',
    emoji: '🤲🍔',
    descricao: 'Restaurantes especiais para uma refeicao caprichada.',
    cor: Color(0xFFFFDED8),
  ),
  Categoria(
    titulo: 'Cafes',
    emoji: '🏪',
    descricao: 'Cafeterias e lugares agradaveis para uma pausa.',
    cor: Color(0xFFE8E4FF),
  ),
  Categoria(
    titulo: 'Nearby 34 Places',
    emoji: '📍',
    descricao: 'Veja lugares proximos e explore a regiao.',
    cor: Color(0xFFFFD43B), // Fundo amarelo solicitado.
  ),
  Categoria(
    titulo: 'Fast Foods',
    emoji: '🍔🍟🥤',
    descricao: 'Hamburgueres, batatas fritas e refrigerantes.',
    cor: Color(0xFFDBF3E7),
  ),
  Categoria(
    titulo: 'Featured Foods',
    emoji: '🍕🧀',
    descricao: 'Conheca pizzas com bastante queijo e outros destaques.',
    cor: Color(0xFFFFE2D6),
  ),
];

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int paginaAtual = 0;

  final titulosAbas = const [
    'Home',
    'Mapa',
    'Agenda',
    'Comida Rank',
    'Profile',
  ];

  void abrirCategoria(Categoria categoria) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaCategoria(categoria: categoria),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todas as cinco opcoes inferiores trocam o conteudo da pagina.
      appBar: AppBar(
        title: Text(paginaAtual == 0 ? 'Food Explorer' : titulosAbas[paginaAtual]),
        backgroundColor: const Color(0xFFFFD43B),
        centerTitle: false,
      ),
      body: paginaAtual == 0
          ? construirHome()
          : TelaAba(
              indice: paginaAtual,
              titulo: titulosAbas[paginaAtual],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        onTap: (indice) {
          setState(() {
            paginaAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF202020),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            activeIcon: Icon(Icons.flag),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            activeIcon: Icon(Icons.emoji_events),
            label: 'Comida Rank',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget construirHome() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Duas colunas no celular e tres em telas mais largas.
        final colunas = constraints.maxWidth >= 650 ? 3 : 2;
        final larguraCard =
            (constraints.maxWidth - 32 - (colunas - 1) * 12) / colunas;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Encontre o lugar perfeito!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Escolha uma categoria para explorar.',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: categorias.map((categoria) {
                  return SizedBox(
                    width: larguraCard,
                    child: Card(
                      color: categoria.cor,
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () => abrirCategoria(categoria),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 16,
                          ),
                          child: SizedBox(
                            height: 126,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  categoria.emoji,
                                  style: const TextStyle(fontSize: 38),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  categoria.titulo,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Pagina individual, aberta quando a pessoa toca em um dos seis cards.
class TelaCategoria extends StatelessWidget {
  final Categoria categoria;

  const TelaCategoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
        backgroundColor: categoria.cor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(categoria.emoji, style: const TextStyle(fontSize: 80)),
              const SizedBox(height: 20),
              Text(
                categoria.titulo,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                categoria.descricao,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar para Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Conteudos das outras quatro abas da BottomNavigationBar.
class TelaAba extends StatelessWidget {
  final int indice;
  final String titulo;

  const TelaAba({
    super.key,
    required this.indice,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    IconData icone;
    String mensagem;

    switch (indice) {
      case 1:
        icone = Icons.map;
        mensagem = 'Area do mapa: visualize aqui os lugares proximos.';
        break;
      case 2:
        icone = Icons.flag;
        mensagem = 'Agenda: organize os lugares que deseja visitar.';
        break;
      case 3:
        icone = Icons.emoji_events;
        mensagem = 'Comida Rank: veja os seus pratos favoritos.';
        break;
      default:
        icone = Icons.person;
        mensagem = 'Profile: pagina com as informacoes do usuario.';
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 86, color: Colors.amber.shade700),
            const SizedBox(height: 18),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
