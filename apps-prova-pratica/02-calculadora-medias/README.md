# App 2 — Calculadora de Médias

**Nível:** iniciante/intermediário. **Arquivo para copiar:** [lib/main.dart](lib/main.dart).

## O que o aplicativo faz
Recebe duas notas de 0 a 10. Quando a pessoa toca **Calcular média**, exibe a média e a situação:
- `media >= 7`: **Aprovado**
- `media < 7`: **Abaixo da média**

**Essa regra de 7 é apenas uma regra de exemplo para treinar condicionais, não uma afirmação sobre o regulamento acadêmico do IFPI.**

## O que você vai aprender
- Dois `TextField` com dois `TextEditingController`.
- `double.tryParse` para transformar texto em número.
- `if` para validar valores inválidos.
- Expressão condicional `? :` para escolher a mensagem.
- `setState` para mostrar o resultado apenas depois de clicar.
- `dispose()` para liberar os controladores.

## Entenda a conta
```dart
final media = (n1 + n2) / 2;
```
Se n1 = 8 e n2 = 6, então média = (8 + 6) / 2 = 7.

```dart
final n1 = double.tryParse(primeiraNota.text.replaceAll(',', '.'));
```
Pega o texto do primeiro campo; troca vírgula por ponto; tenta converter em `double`. Se for inválido, retorna `null`.

## Possíveis mudanças na prova
1. Em vez de 7, usar média mínima 6: troque `media >= 7` por `media >= 6`.
2. Mudar o texto do botão: altere `Text('Calcular média')`.
3. Calcular três notas: crie terceiro `TextEditingController`, `TextField`, faça a validação e use `(n1 + n2 + n3) / 3`.
4. Trocar o tema: edite a cor da barra e do ícone.

**Explique ao professor:** precisamos de `StatefulWidget` porque a variável `resultado` muda quando o botão é pressionado.
