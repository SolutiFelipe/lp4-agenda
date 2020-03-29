import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database/app_database.dart';
import 'package:flutter_app/models/pessoa.dart';
import 'package:flutter_app/screens/formulario_pessoa.dart';
import 'package:flutter_app/screens/item_pessoa.dart';

import 'lista_pessoas.dart';

class ListaPessoasState extends State<ListaPessoas> {
  List<Pessoa> _pessoas = List();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: ListView.builder(
        itemCount: this._pessoas.length,
        itemBuilder: (context, indice){
          Pessoa pessoa = this._pessoas[indice];
          return ItemPessoa(pessoa);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future<Pessoa> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormularioPessoas();
              })
          );
          future.then((pessoa) {
            this._pessoas.add(pessoa);
            this._pessoas.forEach((element) => debugPrint("$element"));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}