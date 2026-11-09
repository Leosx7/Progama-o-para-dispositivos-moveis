import 'dart:io';

void main() {
  print('EXERCÍCIO 2 - CELSIUS PARA FAHRENHEIT');

  stdout.write('Digite a temperatura em Celsius: ');
  double celsius = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

  // Fórmula: Fahrenheit = Celsius * 9 / 5 + 32
  double fahrenheit = celsius * 9 / 5 + 32;

  print('Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(1)} °F');
}
