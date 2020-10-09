import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/data/model/movimentacao_model.dart';
import 'package:edobra/app/data/repository/contacto_repository.dart';
import 'package:edobra/app/data/repository/movimentacao_repository.dart';
import 'package:get/get.dart';

class EnviarController extends GetxController {
  final contactoRepository = ContactoRepository();
  final movimentoRepository = MovimentacaoRepository();
  var _contactosResumo = List<ContctoResumoModel>().obs;
  var contactos = List<ContctoResumoModel>().obs;
  var _favorito = false.obs;

  EnviarController() {
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

 Future<void> listarContactos() async {
    contactosResumo = await contactoRepository.listarContactos(nome, email);
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

  Future<bool> transferir(MovimentacaoModel movimentacaoModel)async{
    return await movimentoRepository.transferir(movimentacaoModel);
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
//TODO: EnviarController
}
