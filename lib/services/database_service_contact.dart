import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/pessoa.dart';

class DatabaseServiceContact {
  String uid;

  DatabaseServiceContact({this.uid});

  final CollectionReference contactsCollection =
      Firestore.instance.collection('contacts');

  Future updateDatabase(Pessoa pessoa) async {
    await contactsCollection
        .document(uid)
        .setData({'name': pessoa.getNome(), 'profession': pessoa.getProfissao()});
  }

  List<Pessoa> _pessoasListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Pessoa(
        profissao: doc.data['profession'],
        nome: doc.data['name'],
      );
    }).toList();
  }

  Stream<List<Pessoa>> get contacts {
    return contactsCollection
        .snapshots()
        .map((QuerySnapshot snapshot) => _pessoasListFromSnapshot(snapshot));
  }
}
