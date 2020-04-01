class Pessoa {
  String _nome;
  String _profissao;
  int _id;

  Pessoa(this._id, this._nome, this._profissao);

  @override
  String toString() {
    return 'Pessoa{_id: $_id, _nome: $_nome, _profissao: $_profissao}';
  }

  String getNome() {
    return this._nome;
  }

  String getProfissao() {
    return this._profissao;
  }

  int getId() {
    return this._id;
  }
}