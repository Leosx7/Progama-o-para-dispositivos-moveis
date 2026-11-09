# Atividade 08 — Cadastro de contatos com SqFlite

Baseada na página 9 dos slides **Persistência com SqFlite**.

## O pedido
Criar um aplicativo para **armazenar, alterar, consultar e excluir contatos**, usando SQLite via `sqflite`.

Tabela: `contatos`, com os campos `id`, `nome` e `email`.

## Como executar (Android)
**Este exemplo foi preparado para Android.** O `sqflite` usado nesta atividade **não funciona diretamente no Chrome**. Para testar, conecte um celular Android com depuração USB ou use um emulador Android.

Na pasta desta atividade:
```bash
flutter create --platforms=android .
flutter pub get
flutter devices
flutter run -d ID_DO_DISPOSITIVO
```

Substitua `ID_DO_DISPOSITIVO` pelo ID exibido em `flutter devices`.

## Como explicar ao professor
- `openDatabase` abre ou cria o arquivo local `contatos.db`.
- `CREATE TABLE` cria a tabela na primeira execução.
- `insert` salva um registro.
- `query` consulta a lista de contatos.
- `update` altera o registro selecionado.
- `delete` exclui o registro.
- `where: 'id = ?'` e `whereArgs` identificam o registro desejado.
- `setState` atualiza a lista na interface.

## PDF pedido no slide
O professor também solicita **um PDF com o código e prints reais das telas**. Execute no Android e faça capturas de tela mostrando a listagem, inserção, alteração e exclusão. Não incluí imagens fabricadas como se fossem resultados de execução.

O aplicativo foi escrito como exemplo didático; teste as operações no aparelho antes de entregar.
