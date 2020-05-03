import 'package:first_project/models/pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPessoa extends StatelessWidget {
  final Pessoa _pessoa;

  ItemPessoa(this._pessoa);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(this._pessoa.getNome()),
        subtitle: Text(this._pessoa.getProfissao()),
        leading: Icon(Icons.person),
      ),
    );
  }
}
