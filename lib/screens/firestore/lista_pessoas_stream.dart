import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/pessoa.dart';
import 'package:first_project/screens/util/item_pessoa.dart';
import 'package:first_project/screens/util/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListaPessoasStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListaPessoasStreamState();
}

class _ListaPessoasStreamState extends State<ListaPessoasStream> {
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

    final pessoas = Provider.of<List<Pessoa>>(context);

    if (pessoas == null) {
      return Progress();
    } else {
      return ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          Pessoa pessoa = pessoas[index];
          return ItemPessoa(pessoa);
        },
      );
    }
  }
}
