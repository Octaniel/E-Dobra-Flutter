import 'package:edobra/app/modules/enviar/pages/concluir_envio_page.dart';
import 'package:edobra/app/modules/enviar/pages/saldo_para_envio_page.dart';
import 'package:edobra/app/modules/home/pages/home_page.dart';
import 'package:edobra/app/modules/home/pages/welcome_page.dart';
import 'package:edobra/app/modules/seguranca/pages/registar_page.dart';
import 'package:edobra/app/modules/solicitar/pages/concluir_pedido_page.dart';
import 'package:edobra/app/modules/solicitar/pages/saldo_para_pedir_page.dart';
import 'package:get/get.dart';

import '../modules/enviar/enviar_binding.dart';
import '../modules/enviar/pages/enviar_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/pagar/pagar_binding.dart';
import '../modules/pagar/pages/pagar_page.dart';
import '../modules/seguranca/pages/login_page.dart';
import '../modules/seguranca/seguranca_binding.dart';
import '../modules/solicitar/pages/pedir_page.dart';
import '../modules/solicitar/solicitar_binding.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.WELCOME, page: () => WelcomePage()),
  GetPage(name: Routes.ENVIAR, page: () => EnviarPage(), binding: EnviarBinding()),
  GetPage(name: Routes.SALDOENVIO, page: () => SaldoParaEnvioPage(), binding: EnviarBinding()),
  GetPage(name: Routes.CONCLUIRENVIO, page: () => ConcluirEnvioPage(), binding: EnviarBinding()),
  GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: SegurancaBinding()),
  GetPage(name: Routes.PAGAR, page: () => PagarPage(), binding: PagarBinding()),
  GetPage(name: Routes.REGISTAR, page: () => RegistrarPage(), binding: SegurancaBinding()),
  GetPage(name: Routes.PEDIR, page: () => SolicitarPage(), binding: SolicitarBinding()),
  GetPage(name: Routes.SALDOPEDIDO, page: () => SaldoParaPedidoPage(), binding: SolicitarBinding()),
  GetPage(name: Routes.CONCLUIRPEDIDO, page: () => ConcluirPedidoPage(), binding: SolicitarBinding()),
];
}