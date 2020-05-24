import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/models/person.dart';

class DatabaseServiceContact {
  String uid;

  DatabaseServiceContact({this.uid});

  final CollectionReference contactsCollection =
      Firestore.instance.collection('contacts');

  Future updateDatabase(Person pessoa) async {
    await contactsCollection
        .document(uid)
        .setData({'name': pessoa.getNome(), 'profession': pessoa.getProfissao()});
  }

  List<Person> _pessoasListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Person(
        profissao: doc.data['profession'],
        nome: doc.data['name'],
      );
    }).toList();
  }

  Stream<List<Person>> get contacts {
    return contactsCollection
        .snapshots()
        .map((QuerySnapshot snapshot) => _pessoasListFromSnapshot(snapshot));
  }

}
