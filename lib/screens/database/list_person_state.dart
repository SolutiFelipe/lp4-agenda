import 'package:first_project/database/dao/person_dao.dart';
import 'package:first_project/models/person.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_person.dart';
import '../util/item_person.dart';
import 'list_person.dart';

class ListPersonState extends State<ListPerson> {
  @override
  Widget build(BuildContext context) {
    PersonDAO _dao = PersonDAO();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: FutureBuilder<List<Person>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2))
            .then((value) => _dao.findAll()),
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
              List<Person> pessoas = snapshot.data;

              return ListView.builder(
                itemCount: pessoas.length,
                itemBuilder: (context, indice) {
                  Person pessoa = pessoas[indice];
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
            return FormPerson();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
