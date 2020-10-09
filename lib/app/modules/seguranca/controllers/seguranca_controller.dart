import 'package:edobra/app/data/model/banco_model.dart';
import 'package:edobra/app/data/model/cliente_model.dart';
import 'package:edobra/app/data/model/pessoa_model.dart';
import 'package:edobra/app/data/model/usuario_model.dart';
import 'package:edobra/app/data/repository/seguranca_repository.dart';
import 'package:get/get.dart';

class SegurancaController extends GetxController{
  final repository = SegurancaRepository();

  var pessoa = PessoaModel();
  var cliente = ClienteModel();
  var usuario = UsuarioModel();

  var _senha = ''.obs;
  var _email = ''.obs;

  get senha => _senha.value;

  set senha(value) {
    _senha.value = value;
  }

  var _circularProgressButaoRegistrar = false.obs;

  get circularProgressButaoRegistrar => _circularProgressButaoRegistrar.value;

  set circularProgressButaoRegistrar(value) {
    _circularProgressButaoRegistrar.value = value;
    update();
  }

  Future<bool> logar() async {
   return await repository.login(senha, email);
  }

  get email => _email.value;

  set email(value) {
    _email.value = value;
  }

  salvarCliente(){

  }

  Future<bool> salvarUsuario() async {
    pessoa.banco = BancoModel(id: 1);
    cliente.pessoa = pessoa;
    usuario.cliente = cliente;
    usuario.confirmacaoSenha = usuario.senha;
    usuario.nome = pessoa.nome.toLowerCase().trim();
   return await repository.add(usuario);
  }



}
