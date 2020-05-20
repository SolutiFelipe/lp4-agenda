import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/pessoa.dart';
import 'package:first_project/screens/firestore/formulario_pessoa_firestore.dart';
import 'package:first_project/screens/firestore/lista_pessoas_stream.dart';
import 'package:first_project/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaPessoasFirestore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListaPessoasFirestoreState();

}

class _ListaPessoasFirestoreState extends State<ListaPessoasFirestore> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Pessoa>>.value(
      value: DatabaseService().contacts,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
        ),
        body: ListaPessoasStream(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioPessoasFirestore();
            }));
          },
            child: const Icon(Icons.add)
        ),
      ),

    );
  }

}
