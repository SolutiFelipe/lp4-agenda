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

class FormularioPessoas extends StatelessWidget {
  TextEditingController _campoNome = TextEditingController();
  TextEditingController _campoProfissao = TextEditingController();

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
      Pessoa pessoa = Pessoa(nome, profissao);
      Navigator.pop(context, pessoa);
    }
  }
}

class Editor extends StatelessWidget {
  TextEditingController _controller;
  String _label;

  Editor(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: this._controller,
      style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(labelText: this._label),
    );
  }
}

class ListaPessoas extends StatelessWidget {
  List<Pessoa> _pessoas = List();

  @override
  Widget build(BuildContext context) {
    this._pessoas.add(Pessoa("Bruce Banner", "Cientista"));
    this._pessoas.add(Pessoa("Bruce Wayne", "Empresário"));

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

  @override
  String toString() {
    return 'Pessoa{_nome: $_nome, _profissao: $_profissao}';
  }
}
