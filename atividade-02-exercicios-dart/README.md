# Atividade 02 — Exercícios básicos em Dart

Disciplina: **Programação para Dispositivos Móveis — IFPI**  
Material: **1ª Resolução de Atividades**, Prof. Rildo Oliveira.

Esta pasta contém oito exercícios do material, cada um com um arquivo `.dart`. Os códigos usam variáveis, listas, `if/else`, laços e entrada de dados de forma simples para facilitar a explicação em sala.

## Como executar

Instale o Dart SDK (ou Flutter SDK, que já inclui Dart). No terminal, entre nesta pasta e execute um exercício por vez:

```bash
dart run exercicio_01.dart
dart run exercicio_02.dart
dart run exercicio_03.dart
dart run exercicio_04.dart
dart run exercicio_05.dart
dart run exercicio_06.dart
dart run exercicio_07.dart
dart run exercicio_08.dart
```

São **programas de terminal**, não telas Flutter; usam `dart:io` para receber valores digitados. Por isso, execute no terminal do VS Code, e não com `flutter run -d chrome`.

## Como estudar e explicar os exercícios

### Exercício 1 — Soma e maior
Pede dois números inteiros. Primeiro, usamos `+` para calcular a soma. Depois, o `if/else` compara os números e guarda o maior. **Exemplo:** 8 e 5 → soma 13, maior 8.

### Exercício 2 — Celsius para Fahrenheit
Lê uma temperatura decimal e aplica `fahrenheit = celsius * 9 / 5 + 32`. **Exemplo:** 0 °C → 32 °F.

### Exercício 3 — Tabela de notas com listas
A lista `alunos` guarda os nomes e a lista `notas` guarda as notas, na mesma ordem. O `for` percorre ambas usando o índice `i`. Mantivemos a nota **DEZ**, por extenso, como está no slide. `padRight` alinha as colunas.

### Exercício 4 — Restaurante e cliente VIP
Mostra categorias numeradas de **0 a 4**, seus pratos e preços. O usuário escolhe uma categoria e um prato. Se informar **S** para VIP, aplica **20% de desconto**: `preco * 0.80`. **Exemplo:** salada simples de R$ 12,00 → R$ 9,60 para cliente VIP. O exercício original solicita a exibição do menu; também incluímos a escolha de um prato e o cálculo final para praticar condições e listas.

### Exercício 5 — Divisível por 3 e por 5
Usa o operador **%**, que calcula o resto da divisão. Se `numero % 3 == 0 && numero % 5 == 0`, o número é divisível pelos dois. **Exemplo:** 15 → sim; 10 → não. `&&` significa **E**.

### Exercício 6 — Soma dos três menores
Lê quatro inteiros **sem permitir valores repetidos**. `contains` verifica se o valor já foi informado. `sort()` ordena a lista do menor para o maior. Somamos as posições `0`, `1` e `2`. **Exemplo:** 8, 2, 6, 1 → 1 + 2 + 6 = 9.

### Exercício 7 — Idade a partir do ano de nascimento
A variável `anoAtual` recebe o ano do relógio do computador por `DateTime.now().year`. A diferença `anoAtual - anoNascimento` indica a idade que a pessoa completa naquele ano. **Importante:** sem a data do aniversário, não dá para saber a idade exata no dia de hoje. Por isso o programa avisa que, se ainda não fez aniversário, a idade é um ano menor.

### Exercício 8 — Locadora de filmes
Recebe o preço normal, o dia da semana e se o filme é lançamento. Em **segundas, terças e quintas** reduz o preço em **40%** (multiplica por `0.60`). Se for **lançamento**, aumenta **15%** (multiplica o valor resultante por `1.15`). **Exemplo:** R$ 20 em uma segunda-feira, lançamento → R$ 20 × 0,60 × 1,15 = **R$ 13,80**. O slide não determina explicitamente a ordem das operações; este código aplica desconto e depois acréscimo sobre o subtotal.

## Para explicar ao professor

- **Variável:** guarda um valor, por exemplo `int numero`.
- **Entrada de dados:** `stdin.readLineSync()` lê o que foi digitado.
- **Conversão:** `int.parse` e `double.parse` transformam texto em número.
- **Condição:** `if/else` escolhe qual bloco executar.
- **Lista:** guarda vários valores com índices que começam em zero.
- **Repetição:** `for` e `while` executam blocos várias vezes.
- **Operadores:** `+` soma, `%` calcula o resto, `&&` exige duas condições verdadeiras.

**Observação:** os exercícios pressupõem entradas numéricas válidas, para deixar o raciocínio principal simples. Se digitar letras no lugar de números, `parse` poderá gerar erro. Essa validação pode ser adicionada futuramente.
