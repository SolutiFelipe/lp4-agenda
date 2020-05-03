import 'package:first_project/models/pessoa.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class PessoaDAO {
  static const tableName = "pessoa";
  static const createTable = "CREATE TABLE $tableName( "
      "id INTEGER PRIMARY KEY, "
      "nome TEXT, "
      "profissao TEXT)";

  Future<int> save(Pessoa pessoa) async {
    Database db = await createDatabase(createTable);

    final Map<String, dynamic> pessoaMap = Map();
    pessoaMap['nome'] = pessoa.getNome();
    pessoaMap['profissao'] = pessoa.getProfissao();

    return db.insert(tableName, pessoaMap);
  }

  Future<List<Pessoa>> findAll() async {
    Database db = await createDatabase(createTable);
    List<Map<String, dynamic>> maps = await db.query(tableName);
    List<Pessoa> pessoas = List();

    for (Map<String, dynamic> map in maps) {
      pessoas.add(Pessoa(
        id: map['id'],
        nome: map['nome'],
        profissao: map['profissao'],
      ));
    }
    return pessoas;
  }
}
