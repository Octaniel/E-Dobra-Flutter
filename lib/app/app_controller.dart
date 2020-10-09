  import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:edobra/app/data/model/usuario_model.dart';
import 'package:get/get.dart';

import 'data/repository/seguranca_repository.dart';

class AppController extends GetxController {
  final repository = SegurancaRepository();

  AppController();

  var _usuario = UsuarioModel().obs;

  UsuarioModel get usuario => _usuario.value;

   set usuario(UsuarioModel value) {
    _usuario.value = value;
  }

  var _caminho = '/home'.obs;

  get caminho => _caminho.value;

  set caminho(value) {
    _caminho.value = value;
    update();
  }

  Future<void> refreshUsuario() async {
    final storage = await LocalStorage.getInstance();
    var id = storage.getInt('idUsuario');
    usuario = await repository.getId(id);
    update();
  }

  Future<bool> logout() async {
    usuario = UsuarioModel();
    return await repository.logout();
  }

  @override
  void onClose() {
    print("object");
    super.onClose();
  }
}
  