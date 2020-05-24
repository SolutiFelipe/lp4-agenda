import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/person.dart';
import 'package:first_project/screens/util/item_person.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListPersonStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPersonStreamState();
}

class _ListPersonStreamState extends State<ListPersonStream> {
  @override
  Widget build(BuildContext context) {
    /*1º iteração
    final contacts = Provider.of<QuerySnapshot>(context);
    print(contacts); */

    /*2º iteração
    final contacts = Provider.of<QuerySnapshot>(context);
    print(contacts.documents);*/

    /*2º iteração
    final contacts = Provider.of<QuerySnapshot>(context);
    for(var doc in contacts.documents) {
      print(doc.data);
    }*/

    final pessoas = Provider.of<List<Person>>(context);

    if (pessoas == null) {
      return Progress();
    } else {
      return ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          Person pessoa = pessoas[index];
          return ItemPessoa(pessoa);
        },
      );
    }
  }
}
