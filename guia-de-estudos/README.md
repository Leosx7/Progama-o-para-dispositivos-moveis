# Base de estudos — Programação para Dispositivos Móveis (IFPI)

Guia para revisar **os exemplos dos slides enviados** e os projetos feitos nas atividades 01 a 08. O objetivo é conseguir **escrever, modificar e explicar o código**, e não só copiá-lo.

> **Como usar:** estude cada tema na ordem, abra o arquivo indicado, explique em voz alta a função de cada parte e tente o desafio sem olhar a solução. Cada aplicativo Flutter é um projeto separado. Os exemplos de Dart puro são executados no terminal.

## 1. Dart básico: lógica de programação

**Projeto:** [Atividade 02](../atividade-02-exercicios-dart/README.md)

**O que treinar:**
- `int` guarda números inteiros, `double` guarda números decimais, `String` guarda textos, `bool` guarda verdadeiro/falso.
- `if/else` decide entre caminhos, `for` e `while` repetem comandos.
- Listas `List<T>` armazenam vários itens; os índices começam em `0`.
- `%` calcula o resto da divisão; `&&` exige que duas condições sejam verdadeiras.

```dart
int numero = 15;
if (numero % 3 == 0 && numero % 5 == 0) {
  print('Divisível por 3 e 5');
}
```

**Explique:** o resultado de `numero % 3` é zero quando a divisão por 3 é exata.

**Pratique:** altere o exercício 5 para verificar divisibilidade por 2 **ou** por 7, usando `||`.

## 2. Classes, objetos, construtores e herança

**Projeto:** [Atividade 03](../atividade-03-classes-construtores/README.md). Os slides **Classes**, de Otilio Paulo, pedem: (a) classes Carro e Avião com velocidade, cor e peso; (b) os mesmos exemplos com construtores; (c) uma classe Veículo e herança, acrescentando número de hélices ao Avião.

```dart
class Veiculo {
  String cor;
  Veiculo(this.cor);
}

class Carro extends Veiculo {
  Carro(String cor) : super(cor);
}

void main() {
  Carro carro = Carro('Vermelho');
  print(carro.cor);
}
```

**Explique:** `class` define o modelo; `Carro('Vermelho')` cria o objeto; `extends` indica herança; `super` chama o construtor da classe base.

**Pratique:** adicione um atributo `placa` apenas na classe `Carro`.

## 3. Estrutura de um app Flutter

**Projeto:** [Atividade 04](../atividade-04-primeiro-app-flutter/README.md). O slide **Flutter — Primeiro Programa** pede mudar tema, título da AppBar para **Home**, retirar a faixa DEBUG, traduzir a frase do corpo e mudar título interno para **Meu App**. O mesmo arquivo de slides também pede **Drawer** com **Saldo, Extrato e Pagamentos** e um texto sobre listas; esta parte não tem um projeto separado publicado no repositório.

```dart
void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(child: Text('Meu primeiro app')),
      ),
    );
  }
}
```

**Explique:** `main` inicia o código; `runApp` inicia o Flutter; `MaterialApp` configura o aplicativo; `Scaffold` cria a estrutura da página; `AppBar` é a barra superior; `body` é o conteúdo.

**Pratique:** substitua o texto por seu nome e adicione uma `Drawer` com os itens do slide.

## 4. Estado e interação: setState

**Projetos:** [Atividade 04 (contador)](../atividade-04-primeiro-app-flutter/README.md) e [Atividade 05 (checkbox)](../atividade-05-listview-checkbox/README.md).

```dart
onChanged: (bool? valor) {
  setState(() {
    item.marcado = valor ?? false;
  });
}
```

**Explique:** `StatefulWidget` pode guardar informação que muda. `onChanged` é executado quando o checkbox muda. `setState` informa ao Flutter que precisa reconstruir a interface com o novo valor.

**Pratique:** comece com os três checkboxes desmarcados e marque cada um individualmente.

## 5. ListView: listas na tela

**Projeto:** [Atividade 05](../atividade-05-listview-checkbox/README.md). O slide **ListView** pede `ListView.builder`, `onChanged` e `setState()` para alterar checkboxes.

```dart
ListView.builder(
  itemCount: itens.length,
  itemBuilder: (context, indice) {
    return ListTile(title: Text(itens[indice].nome));
  },
)
```

**Explique:** `itemCount` é o número de elementos; `itemBuilder` monta cada linha; `indice` indica qual item mostrar.

**Pratique:** acrescente “Macarrão” à lista e mostre a quarta linha.

## 6. Navegação entre telas

**Projeto:** [Atividade 06](../atividade-06-navegacao-flutter/README.md). O slide **Navigation** pede duas páginas, títulos nas AppBars, `push()` e `pop()`, e depois rotas nomeadas.

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SegundaPagina()),
);

// Na segunda página:
Navigator.pop(context);
```

**Explique:** `push` abre uma nova tela, `pop` volta. `pushNamed(context, '/segunda')` abre uma rota previamente cadastrada em `MaterialApp.routes`.

**Pratique:** adicione uma terceira página e um botão que a abra.

## 7. TextField e comparação de combustíveis

**Projeto:** [Atividade 07](../atividade-07-alcool-gasolina/README.md). O slide **Container com TextField** pede ler os preços, calcular `alcool / gasolina * 100` e exibir resultado **apenas depois de clicar em Calcular**.

```dart
final controlador = TextEditingController();
double? preco = double.tryParse(controlador.text.replaceAll(',', '.'));
```

**Explique:** `TextField` recebe texto; `TextEditingController` lê o texto; `tryParse` tenta transformar em número; `setState` mostra o resultado.

**Atenção ao slide:** a regra escrita nele é **resultado >= 70 → álcool; senão gasolina**. Essa condição foi usada no projeto como exercício, embora seja diferente da recomendação econômica mais comum. Não mude sem confirmar o que o professor quer.

**Pratique:** digite álcool 4 e gasolina 5; a conta é **80%**. Explique por que a tela exibe o combustível definido pela condição.

## 8. Persistência local com SqFlite (CRUD)

**Projeto:** [Atividade 08](../atividade-08-contatos-sqflite/README.md). O slide **Persistência com SqFlite** pede cadastro com `id`, `nome` e `email` e operações de **armazenar, alterar, consultar e excluir**.

| Operação | Comando no exemplo | Significado |
|---|---|---|
| Criar | `insert` | Salvar novo contato |
| Ler | `query` | Consultar contatos |
| Atualizar | `update` | Alterar contato |
| Excluir | `delete` | Remover contato |

```dart
await banco!.delete(
  'contatos',
  where: 'id = ?',
  whereArgs: [id],
);
```

**Explique:** a condição `id = ?` seleciona qual contato excluir, e `whereArgs` fornece o valor de forma parametrizada.

**Pratique:** adicione um novo contato, atualize o email e exclua o registro. **Importante:** essa versão usa `sqflite` no Android; não foi preparada para rodar diretamente no Chrome.

## 9. Mapas e geolocalização

**Projeto:** [Atividade 01](../atividade-01-mapa-ifpi/README.md). O PDF original trabalha com **Google Maps**; a versão que fizemos usa **OpenStreetMap** com `flutter_map`, para não depender de uma conta de faturamento Google.

```dart
const LatLng campus = LatLng(-5.088811, -42.810970);

Marker(
  point: campus,
  width: 55,
  height: 55,
  child: const Icon(Icons.location_pin, color: Colors.red),
)
```

**Explique:** `LatLng` guarda latitude e longitude; `TileLayer` carrega o desenho do mapa; `MarkerLayer` mostra os marcadores; `MapController.move` move a visualização. `Geolocator.getCurrentPosition()` solicita a posição aproximada (com permissão). No computador, a precisão pode ser de muitos metros ou quilômetros, pois o navegador pode usar dados de rede em vez de GPS.

**Pratique:** troque as coordenadas de um marcador, mude a cor e faça um botão centralizar no ponto. Não publique coordenadas da sua residência em repositório público.

## Rotina recomendada de revisão

1. **Entender:** leia o README da atividade e o código, bloco por bloco.
2. **Explicar:** diga em voz alta o que cada classe, variável, função e widget faz.
3. **Modificar:** faça uma pequena mudança proposta no desafio.
4. **Testar:** execute e observe se o resultado faz sentido.
5. **Repetir sem copiar:** recrie o essencial a partir de um arquivo vazio.

### Perguntas que você deve conseguir responder
- Qual a diferença entre `StatelessWidget` e `StatefulWidget`?
- Para que serve `setState()`?
- Qual a diferença entre `ListView` e `ListView.builder`?
- O que `Navigator.push` e `Navigator.pop` fazem?
- Como ler um `TextField`?
- O que significa `CRUD`?
- Como adicionar um marcador ao mapa com `LatLng`?
- Por que a geolocalização pode ser imprecisa no Linux?

> **Escopo:** este guia usa os assuntos presentes nos PDFs enviados e nos exemplos publicados. Os desafios são exercícios adicionais de treino, não exigências literais do professor. Os projetos do repositório não foram todos compilados neste ambiente.


---

# Kit de apoio para a atividade prática

> Material **extra de revisão** elaborado para facilitar a execução de exercícios. Os exemplos abaixo são adaptações e dicas de estudo, não novos enunciados do professor. Consulte durante a prova somente se as regras da avaliação permitirem.

## Plano de revisão para sábado e domingo

| Período | Estudar | Fazer sem copiar |
|---|---|---|
| Sábado, manhã | Dart básico, classes e construtores | Exercícios 1, 5 e 6 + criar classe Carro |
| Sábado, tarde | Primeiro app Flutter, widgets e setState | Criar contador e lista de compras |
| Sábado, noite | TextField e cálculo de combustível | Dois campos + botão + resultado |
| Domingo, manhã | ListView e navegação | Checkbox e navegação entre duas telas |
| Domingo, tarde | Mapas, geolocalização e SQLite | Adicionar marcador e explicar CRUD |
| Domingo, noite | Simulado sem consulta + revisão de erros | Refazer os pontos de dificuldade |

**Método:** faça 40–50 minutos de prática, pause, e explique em voz alta o que cada bloco de código faz.

## 10 trechos para reconhecer rapidamente

### 1. Começar um aplicativo Flutter

\`\`\`dart
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
      home: Scaffold(
        body: Center(child: Text('Olá, IFPI!')),
      ),
    );
  }
}
\`\`\`

**Lembre-se:** \`MaterialApp\` inicia o app visual; \`Scaffold\` organiza a tela; \`Center\` centraliza; \`Text\` mostra conteúdo.

### 2. Criar uma tela que muda

\`\`\`dart
class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$contador')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contador++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
\`\`\`

**Lembre-se:** alterações de estado devem provocar atualização visual; o \`setState()\` marca o widget para reconstrução.

### 3. Receber e converter um número em um TextField

\`\`\`dart
final campo = TextEditingController();
double? valor = double.tryParse(campo.text.replaceAll(',', '.'));
if (valor == null) {
  print('Número inválido');
}
\`\`\`

Crie o controlador no \`State\` e libere-o no \`dispose()\`. \`tryParse\` evita exceção com texto não numérico.

### 4. Botão que chama uma função

\`\`\`dart
ElevatedButton(
  onPressed: calcular,
  child: const Text('Calcular'),
)
\`\`\`

**Atenção:** \`onPressed: calcular\` passa a função; não use \`calcular()\` diretamente nessa propriedade quando quiser executá-la somente no clique.

### 5. Condição

\`\`\`dart
if (nota >= 7) {
  print('Aprovado');
} else {
  print('Revisar');
}
\`\`\`

\`==\` compara, \`=\` atribui, \`&&\` significa E, \`||\` significa OU.

### 6. Lista com Checkbox atualizável

\`\`\`dart
CheckboxListTile(
  title: Text(item.nome),
  value: item.marcado,
  onChanged: (valor) {
    setState(() {
      item.marcado = valor ?? false;
    });
  },
)
\`\`\`

\`?? false\` é um valor padrão quando \`valor\` é nulo.

### 7. Abrir e fechar uma segunda tela

\`\`\`dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SegundaPagina()),
);

// Dentro da segunda página:
Navigator.pop(context);
\`\`\`

\`push\` entra; \`pop\` volta. Registre em \`routes\` se a questão pedir rotas nomeadas.

### 8. Mostrar um marcador no mapa

\`\`\`dart
Marker(
  point: const LatLng(-5.088811, -42.810970),
  width: 50,
  height: 50,
  child: const Icon(Icons.location_pin, color: Colors.red),
)
\`\`\`

Este \`Marker\` fica dentro de \`MarkerLayer(markers: [...])\` do \`flutter_map\`. As coordenadas são de exemplo do campus, não da sua casa.

### 9. Solicitar a localização

\`\`\`dart
final permissao = await Geolocator.checkPermission();
if (permissao == LocationPermission.denied) {
  await Geolocator.requestPermission();
}
// Após garantir permissão, solicitar a posição:
final posicao = await Geolocator.getCurrentPosition();
print('\${posicao.latitude}, \${posicao.longitude}');
\`\`\`

Este é um **trecho ilustrativo**: em um app completo, confira novamente se a permissão foi concedida e se o serviço de localização está ativo antes de buscar a posição.

### 10. Comandos básicos do banco de contatos

\`\`\`dart
await banco.insert('contatos', {'nome': 'Ana', 'email': 'ana@exemplo.com'});
final lista = await banco.query('contatos');
await banco.update(
  'contatos',
  {'email': 'novo@exemplo.com'},
  where: 'id = ?',
  whereArgs: [1],
);
await banco.delete('contatos', where: 'id = ?', whereArgs: [1]);
\`\`\`

\`banco\` é uma variável \`Database\` aberta anteriormente com \`openDatabase\`; estes são exemplos de operações, não um aplicativo completo.

## Comandos do terminal que salvam tempo

| Comando | Para que serve |
|---|---|
| \`flutter doctor\` | Verificar se a instalação do Flutter está pronta |
| \`flutter pub get\` | Baixar dependências do \`pubspec.yaml\` |
| \`flutter devices\` | Ver dispositivos disponíveis |
| \`flutter create --platforms=web .\` | Gerar arquivos web no projeto existente |
| \`flutter run -d chrome\` | Executar app Flutter no Chrome |
| \`flutter run -d web-server --web-port=8080\` | Abrir manualmente no navegador |
| \`flutter clean\` | Limpar arquivos gerados de compilação |
| \`dart run exercicio_01.dart\` | Executar um programa Dart de terminal |

No terminal em que \`flutter run\` está ativo, \`r\` faz hot reload, \`R\` faz hot restart e \`q\` encerra.

## Erros frequentes e como pensar

| Mensagem ou sintoma | Primeira verificação |
|---|---|
| \`Undefined name\` ou classe desconhecida | Nome da variável/classe e seus imports |
| \`Expected ';'\` | Ponto e vírgula ao final de instruções |
| \`The name 'MyApp' isn't a class\` no teste | O teste está chamando um nome diferente da classe principal |
| \`No supported devices connected\` | Usar \`flutter devices\`; gerar plataforma web se necessário |
| Tela vermelha ao abrir Google Maps web | Biblioteca Maps JavaScript API e chave autorizada |
| Localização distante e margem de erro grande | Precisão estimada pelo navegador/rede, não necessariamente bug no Dart |
| Checkbox não muda | Verificar \`onChanged\`, variável booleana e \`setState\` |
| \`sqflite\` no Chrome | Exemplo da atividade preparado para Android |
| \`FormatException\` ao converter número | Texto não numérico; usar \`tryParse\` e validar |

## Simulado prático: tente sem olhar a resposta

1. Faça um app com título **Minha Atividade** e sem faixa DEBUG.
2. Adicione um contador e um botão para somar 1.
3. Crie dois \`TextField\` para números e um botão **Somar** que mostre o resultado.
4. Crie uma lista com **Arroz, Feijão e Farinha** e checkboxes que funcionem.
5. Faça duas telas com \`Navigator.push\` e \`Navigator.pop\`.
6. Acrescente um marcador de cor azul ao mapa e um botão que centralize nele.
7. Explique como \`insert\`, \`query\`, \`update\` e \`delete\` seriam usados em um cadastro de contatos.

### Critérios para conferir sua própria solução

- [ ] O programa abre sem erro de compilação.
- [ ] O título da tela está correto.
- [ ] Os botões realmente mudam algo.
- [ ] Os valores digitados são convertidos antes de calcular.
- [ ] As listas e os checkboxes funcionam.
- [ ] Consigo explicar cada \`if\`, \`setState\` e método usado.
- [ ] Sei dizer se o exercício roda no navegador, Android ou terminal Dart.
- [ ] Testei pelo menos uma entrada válida e uma inválida.

## Respostas rápidas para uma explicação oral

**Por que usar StatefulWidget?** Porque há uma informação que pode mudar, como contador, checkbox, resultado ou lista de contatos.

**O que faz o build()?** Descreve os widgets que compõem a interface no estado atual.

**O que faz um TextEditingController?** Permite ler e controlar o texto de um campo.

**Por que existe o dispose()?** Para liberar recursos, como controladores de texto, quando o widget sai da tela.

**Qual a diferença entre push e pop?** O primeiro abre outra rota; o segundo retorna removendo a rota atual.

**O que significa CRUD?** Create, Read, Update, Delete — cadastrar, consultar, alterar e excluir.

**Qual a diferença entre latitude e longitude?** Latitude representa a posição norte/sul, longitude leste/oeste.

**Por que o mapa pode mostrar minha posição errada?** O navegador pode fornecer uma posição aproximada com grande margem de erro em computadores sem GPS.

---

**Na véspera da prova:** priorize escrever de memória um \`StatelessWidget\`, um \`StatefulWidget\` com \`setState\`, um \`TextField\` com botão, um \`ListView.builder\` e um \`Navigator.push/pop\`. Depois revise o código do mapa e o CRUD de contatos.
