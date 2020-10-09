    import 'package:get/get.dart';

import 'controllers/solicitar_controller.dart';

class SolicitarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SolicitarController>(SolicitarController());
  }
}
    