import 'dart:io';

void main() {
  print('EXERCÍCIO 4 - MENU DE RESTAURANTE');

  print('Você é cliente VIP?');
  stdout.write('Digite S para sim ou N para não: ');
  String vip = stdin.readLineSync()!.toUpperCase();

  print('\nMENU DE RESTAURANTE');
  print('0 - Saladas');
  print('1 - Sopas');
  print('2 - Frutos do Mar');
  print('3 - Sanduíches');
  print('4 - Sucos');

  stdout.write('Escolha uma categoria (0 a 4): ');
  int categoria = int.parse(stdin.readLineSync()!);

  // Cada categoria mostra seus pratos e preços.
  List<String> nomes = [];
  List<double> precos = [];

  if (categoria == 0) {
    nomes = ['Salada simples', 'Salada mista'];
    precos = [12.00, 18.50];
  } else if (categoria == 1) {
    nomes = ['Sopa de cebola', 'Ao molho de fígado'];
    precos = [18.00, 22.50];
  } else if (categoria == 2) {
    nomes = ['Camarão à milanesa', 'Bacalhau ao noir'];
    precos = [36.00, 48.50];
  } else if (categoria == 3) {
    nomes = ['Triplo X', 'Calderone', 'XRasputin'];
    precos = [16.50, 11.50, 14.50];
  } else if (categoria == 4) {
    nomes = ['Frutas naturais', 'Vitaminas'];
    precos = [6.50, 8.50];
  } else {
    print('Categoria inválida.');
    return;
  }

  print('\nPRATOS DISPONÍVEIS');
  for (int i = 0; i < nomes.length; i++) {
    print('$i - ${nomes[i]}: R\$ ${precos[i].toStringAsFixed(2)}');
  }

  stdout.write('Escolha o número do prato: ');
  int escolha = int.parse(stdin.readLineSync()!);

  if (escolha < 0 || escolha >= nomes.length) {
    print('Prato inválido.');
    return;
  }

  double valor = precos[escolha];

  if (vip == 'S') {
    valor = valor * 0.80; // VIP paga 80%: desconto de 20%.
  }

  print('Prato escolhido: ${nomes[escolha]}');
  print('Total a pagar: R\$ ${valor.toStringAsFixed(2)}');
}
