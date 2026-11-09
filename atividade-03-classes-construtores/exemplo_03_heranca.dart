// A classe Veiculo guarda o que carro e avião têm em comum.
class Veiculo {
  double velocidade;
  String cor;
  double peso;

  Veiculo(this.velocidade, this.cor, this.peso);
}

// Carro herda os atributos da classe Veiculo.
class Carro extends Veiculo {
  Carro(double velocidade, String cor, double peso)
      : super(velocidade, cor, peso);
}

// Avião também herda Veiculo e acrescenta o número de hélices.
class Aviao extends Veiculo {
  int numeroHelices;

  Aviao(double velocidade, String cor, double peso, this.numeroHelices)
      : super(velocidade, cor, peso);
}

void main() {
  Carro carro = Carro(80, 'Vermelho', 1000);
  Aviao aviao = Aviao(700, 'Branco', 5000, 2);

  print('CARRO: ${carro.cor}, ${carro.velocidade} km/h, ${carro.peso} kg');
  print('AVIÃO: ${aviao.cor}, ${aviao.velocidade} km/h, ${aviao.peso} kg');
  print('Quantidade de hélices do avião: ${aviao.numeroHelices}');
}
