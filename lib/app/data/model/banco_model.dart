class BancoModel{
  int id;
  String morada;
  String nome;
  String email;
  String nif;
  DateTime dataCriacao;
  DateTime dataAlteracao;

  BancoModel({this.id, this.morada, this.nome, this.email, this.nif,
      this.dataCriacao, this.dataAlteracao});

  BancoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    morada = json['morada'];
    nome = json['nome'];
    email = json['email'];
    nif = json['nif'];
    dataCriacao = DateTime.parse(json['dataCriacao']);
    dataAlteracao = DateTime.parse(json['dataAlteracao']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'morada': morada,
      'nome': nome,
      'email': email,
      'nif': nif,
      'dataCriacao': dataCriacao,
      'dataAlteracao': dataAlteracao
    };
  }
}