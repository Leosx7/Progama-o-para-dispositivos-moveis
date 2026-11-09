// O construtor permite informar os dados ao criar o objeto.
class Carro {
  double velocidade;
  String cor;
  double peso;

  Carro(this.velocidade, this.cor, this.peso);
}

class Aviao {
  double velocidade;
  String cor;
  double peso;

  Aviao(this.velocidade, this.cor, this.peso);
}

void main() {
  Carro carro = Carro(80, 'Vermelho', 1000);
  Aviao aviao = Aviao(700, 'Branco', 5000);

  print('Carro: ${carro.cor}, ${carro.velocidade} km/h, ${carro.peso} kg');
  print('Avião: ${aviao.cor}, ${aviao.velocidade} km/h, ${aviao.peso} kg');
}
