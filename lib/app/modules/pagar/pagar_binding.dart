    import 'package:get/get.dart';

import 'controllers/pagar_controller.dart';

class PagarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PagarController>(PagarController());
  }
}
    