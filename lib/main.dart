import 'package:flutter/material.dart';

void main() => runApp(AgendaApp());

class AgendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ListaPessoas(),
      ),
    );
  }

}

class ListaPessoas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: ListView(
        children: <Widget>[
          ItemPessoa(
            Pessoa(
              "Bruce Wayne",
              "Empresário",
            ),
          ),
          ItemPessoa(
            Pessoa(
              "Carol Danvers",
              "Piloto",
            ),
          ),
          ItemPessoa(
            Pessoa(
              "Peter Park",
              "Fotógrafo",
            ),
          ),
          ItemPessoa(
            Pessoa(
              "Tony Start",
              "Empresário",
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("clicou no botão");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemPessoa extends StatelessWidget {
  Pessoa _pessoa;

  ItemPessoa(this._pessoa);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(this._pessoa._nome),
        subtitle: Text(this._pessoa._profissao),
        leading: Icon(Icons.person),
      ),
    );
  }
}

class Pessoa {
  String _nome;
  String _profissao;

  Pessoa(this._nome, this._profissao);
}
