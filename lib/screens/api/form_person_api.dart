import 'package:first_project/models/person.dart';
import 'package:first_project/web_client/web_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/editor.dart';

class FormPersonApi extends StatelessWidget {
  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoProfissao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Pessoa"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Column(
          children: <Widget>[
            Editor(
              this._campoNome,
              "Nome",
            ),
            Editor(
              this._campoProfissao,
              "Profissão",
            ),
            RaisedButton(
              onPressed: () {
                this._criarPessoa(context);
              },
              child: Text("Confirmar"),
            )
          ],
        ),
      ),
    );
  }

  void _criarPessoa(BuildContext context) {
    String nome = this._campoNome.text;
    String profissao = this._campoProfissao.text;
    if (nome.isNotEmpty && profissao.isNotEmpty) {
      Person pessoa = Person(
        nome: nome,
        profissao: profissao,
      );
      save(pessoa).then((response) {
        if(response) {
          Navigator.pop(context, pessoa);
        } else {
          print("Erro ao salvar pessoa");
        }

      });
    }
  }
}
