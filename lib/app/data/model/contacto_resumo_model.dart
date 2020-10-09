class ContctoResumoModel {
  int id;
  String nome;
  String email;
  String telemovel;
  String idOneSignal;
  bool favorito;

  ContctoResumoModel(
      {this.id, this.nome, this.email, this.telemovel, this.idOneSignal, this.favorito});

  ContctoResumoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    telemovel = json['telemovel'];
    idOneSignal = json['idOneSignal'];
    favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'idOneSignal': idOneSignal,
    };
  }
}
