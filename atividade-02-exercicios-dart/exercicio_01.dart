import 'dart:io';

void main() {
  print('EXERCÍCIO 1 - SOMA E MAIOR NÚMERO');

  stdout.write('Digite o primeiro número inteiro: ');
  int numero1 = int.parse(stdin.readLineSync()!);

  stdout.write('Digite o segundo número inteiro: ');
  int numero2 = int.parse(stdin.readLineSync()!);

  int soma = numero1 + numero2;
  int maior;

  if (numero1 >= numero2) {
    maior = numero1;
  } else {
    maior = numero2;
  }

  print('A soma dos números é: $soma');
  print('O maior número é: $maior');
}
