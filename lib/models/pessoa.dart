class Pessoa {
  String _nome;
  String _profissao;

  Pessoa(this._nome, this._profissao);

  @override
  String toString() {
    return 'Pessoa{_nome: $_nome, _profissao: $_profissao}';
  }

  String getNome() {
    return this._nome;
  }

  String getProfissao() {
    return this._profissao;
  }
}