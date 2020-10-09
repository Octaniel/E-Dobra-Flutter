    import 'package:get/get.dart';

import 'controllers/enviar_controller.dart';

class EnviarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EnviarController>(EnviarController());
  }
}
    