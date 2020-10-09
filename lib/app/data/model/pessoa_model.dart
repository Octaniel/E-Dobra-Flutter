import 'package:edobra/app/data/model/banco_model.dart';

class PessoaModel {
  int id;
  String nome;
  String email;
  BancoModel banco;
  String nConta;
  String morada;
  String telemovel;
  String nif;
  DateTime dataNascimento;
  DateTime dataCriacao;
  DateTime dataAlteracao;
  double saldo;
  String codigo;
  String idOneSignal;
  PessoaModel(
      {this.id,
      this.nome,
      this.email,
      this.banco,
      this.nConta,
      this.morada,
      this.telemovel,
      this.nif,
      this.dataNascimento,
      this.dataCriacao,
      this.dataAlteracao,
      this.saldo,
      this.codigo,
      this.idOneSignal});

  PessoaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    banco = BancoModel.fromJson(json['banco']);
    nConta = json['nConta'];
    morada = json['morada'];
    telemovel = json['telemovel'];
    nif = json['nif'];
    dataNascimento = DateTime.parse(json['dataNascimento']);
    dataCriacao = DateTime.parse(json['dataCriacao']);
    dataAlteracao = DateTime.parse(json['dataAlteracao']);
    saldo = json['saldo'];
    codigo = json['codigo'];
    idOneSignal = json['idOneSignal'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'banco': banco.toJson(),
      'nconta': nConta,
      'morada': morada,
      'telemovel': telemovel,
      'nif': nif,
      'dataNascimento': dataNascimento,
      'dataCriacao': dataCriacao,
      'dataAlteracao': dataAlteracao,
      'saldo': saldo,
      'codigo': codigo,
      'idOneSignal': idOneSignal,
    };
  }

  Map<String, dynamic> toJsonEstandoDentro() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }
}
