import 'package:first_project/models/person.dart';
import 'package:first_project/screens/api/form_person_api.dart';
import 'package:first_project/screens/util/item_person.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:first_project/web_client/web_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPersonApi extends StatefulWidget{

  @override
  _ListPersonApiState createState() => _ListPersonApiState();
}

class _ListPersonApiState extends State<ListPersonApi> {
  List<Person> pessoas;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: FutureBuilder<List<Person>>(
        initialData: List(),
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              this.pessoas = snapshot.data;

              return ListView.builder(
                itemCount: this.pessoas.length,
                itemBuilder: (context, indice) {
                  Person pessoa = this.pessoas[indice];
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
            return FormPersonApi();
          })).then((pessoa) => this.pessoas.add(pessoa));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}