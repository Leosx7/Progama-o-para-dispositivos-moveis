import 'dart:io';

void main() {
  print('EXERCÍCIO 7 - IDADE PELO ANO DE NASCIMENTO');

  // O exercício pede que o ano atual esteja em uma variável.
  int anoAtual = DateTime.now().year;

  stdout.write('Digite seu ano de nascimento: ');
  int anoNascimento = int.parse(stdin.readLineSync()!);

  if (anoNascimento > anoAtual || anoNascimento <= 0) {
    print('Ano de nascimento inválido.');
    return;
  }

  int idade = anoAtual - anoNascimento;

  print('Em $anoAtual você completa $idade anos.');
  print('Se ainda não fez aniversário, sua idade atual é ${idade - 1}.');
}
