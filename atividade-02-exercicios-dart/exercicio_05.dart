import 'dart:io';

void main() {
  print('EXERCÍCIO 5 - DIVISÍVEL POR 3 E POR 5');

  stdout.write('Digite um número inteiro: ');
  int numero = int.parse(stdin.readLineSync()!);

  // O operador % retorna o resto de uma divisão.
  if (numero % 3 == 0 && numero % 5 == 0) {
    print('O número é divisível por 3 e por 5 ao mesmo tempo.');
  } else {
    print('O número NÃO é divisível pelos dois ao mesmo tempo.');
  }
}
