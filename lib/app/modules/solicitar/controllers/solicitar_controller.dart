import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/data/model/pedido_saldo_model.dart';
import 'package:edobra/app/data/repository/contacto_repository.dart';
import 'package:edobra/app/data/repository/pedido_saldo_repository.dart';
import 'package:get/get.dart';

class SolicitarController extends GetxController{
  final contactoRepository = ContactoRepository();
  final pedidoSaldoRepository = PedidoSaldoRepository();
  var _contactosResumo = List<ContctoResumoModel>().obs;
  var contactos = List<ContctoResumoModel>().obs;
  var _favorito = false.obs;

  SolicitarController() {
    verificarSeExistePeloMenosUmContactoFavorito();
  }

  List<ContctoResumoModel> get contactosResumo => _contactosResumo.value;

  String email = '';
  String nome = '';

  get favorito => _favorito.value;

  set favorito(value) {
    _favorito.value = value;
  }

  set contactosResumo(value) {
    _contactosResumo.value = value;
  }

  listarContactos() async {
    contactosResumo = await contactoRepository.listarContactos(nome, email);
    update();
    contactos.value = contactosResumo;
  }

  filtrarContactos(String emailOuSenha) {
    print(emailOuSenha);
    contactosResumo = contactos.value
        .where((element) =>
    element.email.toLowerCase().contains(emailOuSenha.toLowerCase()) ||
        element.nome.toLowerCase().contains(emailOuSenha.toLowerCase()))
        .toList();
    update();
  }

  Future<bool> pedir(PedidoSaldoModel pedidoSaldoModel)async{
    return await pedidoSaldoRepository.salvar(pedidoSaldoModel);
  }

  Future<void> verificarSeExistePeloMenosUmContactoFavorito() async {
    await listarContactos();
    if(contactosResumo.length==0) favorito = false;
    else {
      var firstWhere = contactosResumo.firstWhere((element) => element.favorito,
          orElse: null);
      if (firstWhere == null)
        favorito = false;
      else
        favorito = true;
    }
    update();
  }

  //TODO: SolicitarController
}
