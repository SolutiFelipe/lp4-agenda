import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database/app_database.dart';
import 'package:flutter_app/models/pessoa.dart';
import 'package:flutter_app/screens/formulario_pessoa.dart';
import 'package:flutter_app/screens/item_pessoa.dart';

import 'lista_pessoas.dart';

class ListaPessoasState extends State<ListaPessoas> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: FutureBuilder<List<Pessoa>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Pessoa> pessoas = snapshot.data;

              return ListView.builder(
                itemCount: pessoas.length,
                itemBuilder: (context, indice) {
                  Pessoa pessoa = pessoas[indice];
                  return ItemPessoa(pessoa);
                },
              );
              break;
          }
          return null;

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioPessoas();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
