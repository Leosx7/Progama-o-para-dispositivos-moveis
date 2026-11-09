void main() {
  print('EXERCÍCIO 3 - TABELA DE NOTAS');

  // Duas listas: uma com os nomes e outra com as notas.
  List<String> alunos = ['ALINE', 'MÁRIO', 'SÉRGIO', 'SHIRLEY'];
  List<String> notas = ['9.0', 'DEZ', '4.5', '7.0'];

  print('ALUNO(A)       NOTA');
  print('========       ====');

  // O índice i indica a posição nas duas listas.
  for (int i = 0; i < alunos.length; i++) {
    print('${alunos[i].padRight(15)}${notas[i]}');
  }
}
