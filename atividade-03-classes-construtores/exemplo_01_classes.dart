// Primeira parte da aula: criando classes sem construtor.
class Carro {
  double velocidade = 0;
  String cor = '';
  double peso = 0;
}

class Aviao {
  double velocidade = 0;
  String cor = '';
  double peso = 0;
}

void main() {
  Carro carro = Carro();
  carro.velocidade = 80;
  carro.cor = 'Vermelho';
  carro.peso = 1000;

  Aviao aviao = Aviao();
  aviao.velocidade = 700;
  aviao.cor = 'Branco';
  aviao.peso = 5000;

  print('CARRO');
  print('Velocidade: ${carro.velocidade} km/h');
  print('Cor: ${carro.cor}');
  print('Peso: ${carro.peso} kg');

  print('\nAVIÃO');
  print('Velocidade: ${aviao.velocidade} km/h');
  print('Cor: ${aviao.cor}');
  print('Peso: ${aviao.peso} kg');
}
