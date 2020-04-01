import 'package:flutter_app/models/pessoa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'agenda.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute("CREATE TABLE pessoa( "
          "id INTEGER PRIMARY KEY, "
          "nome TEXT, "
          "profissao TEXT)");
    }, version: 1);
  });
}

Future<int> save(Pessoa pessoa) {
  return createDatabase().then((db) {
    final Map<String, dynamic> pessoaMap = Map();

    pessoaMap['nome'] = pessoa.getNome();
    pessoaMap['profissao'] = pessoa.getProfissao();

    return db.insert('pessoa', pessoaMap);
  });
}

Future<List<Pessoa>> findAll() {
  return createDatabase().then((db) {
    return db.query('pessoa').then((maps) {
      List<Pessoa> pessoas = List();

      for (Map<String, dynamic> map in maps) {
        pessoas.add(Pessoa(
          map['id'],
          map['nome'],
          map['profissao'],
        ));
      }

      return pessoas;
    });
  });
}
