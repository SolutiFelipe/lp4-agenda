class Pessoa {
  String nome;
  String profissao;
  int id;

  Pessoa({this.id, this.nome, this.profissao});

  @override
  String toString() {
    return 'Pessoa{_id: $id, _nome: $nome, _profissao: $profissao}';
  }

  String getNome() {
    return this.nome;
  }

  String getProfissao() {
    return this.profissao;
  }

  int getId() {
    return this.id;
  }
}
