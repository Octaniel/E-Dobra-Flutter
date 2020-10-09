import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:edobra/app/data/model/cliente_model.dart';
import 'package:edobra/app/data/provider/seguranca_provider.dart';

class UsuarioModel {
  int id;
  String nome;
  String senha;
  ClienteModel cliente;
  String confirmacaoSenha;
  DateTime dataCriacao;
  DateTime dataAlteracao;

  UsuarioModel({this.id, this.nome});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    senha = json['senha'];
    cliente = ClienteModel.fromJson(json['cliente']);
    confirmacaoSenha = json['confirmacaoSenha'];
    dataCriacao = DateTime.parse(json['dataCriacao']);
    dataAlteracao = DateTime.parse(json['dataAlteracao']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'senha': senha,
      'cliente': cliente.toJson(),
      'confirmacaoSenha': confirmacaoSenha,
      'dataCriacao': dataCriacao,
      'dataAlteracao': dataAlteracao,
    };
  }

  Future<void> fromStorage() async {
    final storage = await LocalStorage.getInstance();
    id = await storage.getInt('idUsuario');
    var usuario = await SegurancaProvider().getId(id);

  }
}
