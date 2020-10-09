import 'package:edobra/app/data/model/pessoa_model.dart';

class ClienteModel {
  int id;
  PessoaModel pessoa;
  DateTime dataCriacao;
  DateTime dataAlteracao;

  ClienteModel();

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pessoa = PessoaModel.fromJson(json['pessoa']);
    dataCriacao = DateTime.parse(json['dataCriacao']);
    dataAlteracao = DateTime.parse(json['dataAlteracao']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'pessoa': pessoa.toJson(),
      'dataCriacao': dataCriacao,
      'dataAlteracao': dataAlteracao,
    };
  }
}
