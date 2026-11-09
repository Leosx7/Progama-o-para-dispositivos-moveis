import 'dart:io';

void main() {
  print('EXERCÍCIO 6 - SOMA DOS TRÊS MENORES');

  List<int> numeros = [];

  // Repete até receber quatro números diferentes.
  while (numeros.length < 4) {
    stdout.write('Digite o ${numeros.length + 1}º número: ');
    int numero = int.parse(stdin.readLineSync()!);

    if (numeros.contains(numero)) {
      print('Número repetido! Digite outro.');
    } else {
      numeros.add(numero);
    }
  }

  // Organiza em ordem crescente: do menor para o maior.
  numeros.sort();

  int soma = numeros[0] + numeros[1] + numeros[2];

  print('Os três menores são: ${numeros[0]}, ${numeros[1]} e ${numeros[2]}');
  print('A soma dos três menores é: $soma');
}
