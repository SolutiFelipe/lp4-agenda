import 'package:first_project/database/dao/pessoa_dao.dart';
import 'package:first_project/models/pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editor.dart';

class FormularioPessoas extends StatelessWidget {
  final TextEditingController _campoNome = TextEditingController();
  final TextEditingController _campoProfissao = TextEditingController();

  final PessoaDAO _dao = PessoaDAO();

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
      Pessoa pessoa = Pessoa(
        nome: nome,
        profissao: profissao,
      );
      _dao.save(pessoa).then((id) {
        Navigator.pop(context);
      });
    }
  }
}
