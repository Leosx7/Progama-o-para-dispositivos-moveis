# Atividade 07 — Combustível: álcool e gasolina

Baseada na página 15 dos slides **Container com TextField**.

## O pedido
- Dois campos de texto para os preços de álcool e gasolina;
- Resultado exibido **somente quando clicar em Calcular**;
- Cálculo `alcool / gasolina * 100`;
- Segundo o slide: **se resultado >= 70, mostrar álcool; senão, gasolina**;
- Entregar um PDF com captura de tela do aplicativo rodando.

**Atenção para o estudo:** a regra escrita no slide indica álcool quando a porcentagem é **maior ou igual a 70**. Isso é diferente da regra econômica usual, que em muitos exemplos recomenda álcool **abaixo** de 70%. O código acompanha o enunciado literalmente. Confirme com o professor caso ele deseje a regra econômica.

## Rodar no Chrome
```bash
flutter create --platforms=web .
flutter pub get
flutter run -d chrome
```

## Para explicar
`TextField` recebe o preço. `TextEditingController` lê o que o usuário digitou. `double.tryParse` tenta converter texto em número. `if` escolhe qual mensagem mostrar. `setState` faz o resultado aparecer somente depois do clique.

## Entrega em PDF
Depois de rodar no seu computador, tire uma captura de tela com o resultado aparecendo e salve em PDF junto do código. Capturas **reais** ainda precisam ser feitas no seu ambiente; não foram incluídas capturas simuladas no repositório.
