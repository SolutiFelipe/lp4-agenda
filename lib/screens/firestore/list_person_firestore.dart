import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/person.dart';
import 'package:first_project/screens/firestore/form_person_firestore.dart';
import 'package:first_project/screens/firestore/list_person_stream.dart';
import 'package:first_project/services/database_service_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPersonFirestore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPersonFirestoreState();

}

class _ListPersonFirestoreState extends State<ListPersonFirestore> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Person>>.value(
      value: DatabaseServiceContact().contacts,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
        ),
        body: ListPersonStream(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormPersonFirestore();
            }));
          },
            child: const Icon(Icons.add)
        ),
      ),

    );
  }

}
