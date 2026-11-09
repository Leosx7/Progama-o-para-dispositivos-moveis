import 'dart:io';

void main() {
  print('EXERCÍCIO 8 - LOCADORA DE FILMES');

  stdout.write('Preço normal do aluguel: R\$ ');
  double preco = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

  print('1 = domingo, 2 = segunda, 3 = terça, 4 = quarta,');
  print('5 = quinta, 6 = sexta, 7 = sábado');
  stdout.write('Digite o dia da semana (1 a 7): ');
  int dia = int.parse(stdin.readLineSync()!);

  if (dia < 1 || dia > 7 || preco < 0) {
    print('Dia ou preço inválido.');
    return;
  }

  stdout.write('É lançamento? (S/N): ');
  String lancamento = stdin.readLineSync()!.toUpperCase();

  // Segunda, terça e quinta: desconto de 40%.
  if (dia == 2 || dia == 3 || dia == 5) {
    preco = preco * 0.60;
  }

  // Para lançamentos, acrescenta 15% sobre o valor após o desconto.
  if (lancamento == 'S') {
    preco = preco * 1.15;
  }

  print('Valor final do aluguel: R\$ ${preco.toStringAsFixed(2)}');
}
