# App 4 — Food Explorer (cards + BottomNavigationBar)

Este aplicativo foi criado a partir da descrição do enunciado da atividade prática. **A imagem original da interface não foi fornecida**, portanto o layout segue os seis nomes e símbolos descritos, mas pode diferir visualmente da ilustração do professor.

## Código completo para copiar

**[Abrir lib/main.dart](lib/main.dart)** — copie todo o conteúdo e cole em um projeto Flutter novo. Não há pacotes adicionais além do Flutter.

## O que foi implementado

| Card | Ícone visual | Comportamento |
|---|---|---|
| Bars & Hotels | 🍺 | Abre uma página da categoria |
| Fine Dining | 🤲🍔 | Abre uma página da categoria |
| Cafes | 🏪 | Abre uma página da categoria |
| Nearby 34 Places | 📍 com fundo amarelo | Abre uma página da categoria |
| Fast Foods | 🍔🍟🥤 | Abre uma página da categoria |
| Featured Foods | 🍕🧀 | Abre uma página da categoria |

Os ícones dos cards usam **emojis** como aproximação dos desenhos indicados, sem depender de imagens externas. Dependendo do computador, alguns emojis podem ter aparência diferente.

O menu inferior contém **Home (casa), Mapa (mapa), Agenda (bandeira), Comida Rank (troféu) e Profile (usuário)**. Cada opção mostra uma página diferente. A aba Mapa é uma tela ilustrativa — **não integra um mapa real**, pois o enunciado pediu navegação e ícones, não geolocalização.

## Como executar

### Pelo FlutLab
1. Crie um app Flutter novo.
2. Abra \`lib/main.dart\` e substitua pelo conteúdo do arquivo.
3. Pressione Run.
4. Toque nos seis cards e nas cinco opções inferiores para testar a navegação.

### Pelo terminal Linux (Ubuntu)

Se você copiou esta pasta do GitHub:
\`\`\`bash
cd apps-prova-pratica/04-guia-gastronomico
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
\`\`\`

Se o Chrome não iniciar a depuração:
\`\`\`bash
flutter run -d web-server --web-port=8080
\`\`\`
Abra \`http://localhost:8080\` no navegador.

## Guia de estudos para explicar na prova

**1. \`MaterialApp\`:** inicia o aplicativo e define configurações gerais.

**2. \`Scaffold\`:** organiza a tela com \`appBar\`, \`body\` e \`bottomNavigationBar\`.

**3. \`StatefulWidget\`:** a tela principal usa estado porque a opção selecionada da barra inferior muda.

**4. \`int paginaAtual = 0\`:** salva o índice da aba que está aberta. O índice 0 é Home; 1 é Mapa; 2 é Agenda; 3 é Comida Rank; 4 é Profile.

**5. \`setState(() { paginaAtual = indice; })\`:** muda a aba escolhida e reconstrói a interface mostrando a nova página.

**6. \`BottomNavigationBar\`:** cria o menu com os cinco ícones. \`onTap\` é executado quando a pessoa seleciona uma opção.

**7. \`Wrap\` e \`Card\`:** exibem os seis cards; \`InkWell(onTap: ...)\` torna cada card clicável.

**8. \`Navigator.push\`:** abre a página da categoria selecionada.

**9. \`Navigator.pop(context)\`:** volta da página de detalhes para a Home.

**10. \`Categoria\`:** classe com \`titulo\`, \`emoji\`, \`descricao\` e \`cor\`. A lista \`categorias\` guarda as seis opções.

### Trechos importantes

\`\`\`dart
// Quando toca no card, abre uma tela:
onTap: () => abrirCategoria(categoria)
\`\`\`

\`\`\`dart
// Quando toca em um item da barra inferior, troca a página:
onTap: (indice) {
  setState(() {
    paginaAtual = indice;
  });
}
\`\`\`

\`\`\`dart
// A tela de detalhes abre pelo Navigator:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TelaCategoria(categoria: categoria),
  ),
);
\`\`\`

### Se o professor pedir uma alteração

- **Trocar o título de um card:** edite \`titulo:\` na lista \`categorias\`.
- **Trocar o símbolo:** edite o campo \`emoji:\`.
- **Trocar cor do card:** edite \`cor: Color(...)\`.
- **Trocar uma frase de uma página:** edite \`descricao:\` ou \`mensagem\`.
- **Mudar a cor da barra superior:** edite \`backgroundColor:\` do \`AppBar\`.
- **Adicionar categoria:** copie um \`Categoria(...)\` e altere os campos; os cards são gerados automaticamente.

### Perguntas rápidas

**Por que usar StatefulWidget?** Porque o índice da aba escolhida muda quando alguém toca no menu inferior.

**Qual a diferença entre tocar num card e tocar no menu inferior?** O card abre uma rota com \`Navigator.push\`. O menu inferior altera a aba na mesma tela com \`setState\`.

**Por que existe \`Wrap\`?** Para organizar cards em linhas, com quebra automática quando não cabem na largura.

**Onde ficam os seis cards?** Na lista \`categorias\`, no começo do arquivo.

**Onde ficam os ícones da barra inferior?** Dentro de \`BottomNavigationBar(items: [...])\`.

## Checklist de teste

- [ ] App abre sem erro.
- [ ] Seis cards aparecem na Home.
- [ ] Nearby tem fundo amarelo.
- [ ] Cada card abre uma página própria.
- [ ] O botão voltar funciona.
- [ ] Todas as cinco opções inferiores alteram a página.
- [ ] Os títulos e ícones aparecem corretamente no dispositivo.

**Status:** os arquivos foram publicados no GitHub. Não houve compilação do Flutter neste ambiente; faça um teste no FlutLab ou em uma instalação Flutter antes de entregar.
