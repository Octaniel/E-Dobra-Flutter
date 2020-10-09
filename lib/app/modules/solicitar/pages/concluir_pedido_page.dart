import 'package:edobra/app/app_controller.dart';
import 'package:edobra/app/data/model/pedido_saldo_model.dart';
import 'package:edobra/app/modules/home/widgets/enviados_recentes_avatar_home_widget.dart';
import 'package:edobra/app/modules/solicitar/controllers/solicitar_controller.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:edobra/app/widgets/button_seginte_enviar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ConcluirPedidoPage extends GetView<SolicitarController> {
  @override
  Widget build(BuildContext context) {
    PedidoSaldoModel pedidoSaldoModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: 'Concluir Pedido'
            .text
            .size(20)
            .semiBold
            .color(Color(0xFF495157))
            .make(),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            'Para'.text.color(Color(0xFF585858)).size(20).semiBold.make(),
            Card(
              elevation: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        EnviadosRecentesAvatarHomeWidget(
                            pedidoSaldoModel.contacto.nome.substring(0, 2),
                            null,
                            Color(0xFF2B419C)),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 245,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pedidoSaldoModel.contacto.nome.text
                                  .size(18)
                                  .bold
                                  .color(Color(0xFF666666))
                                  .make(),
                              pedidoSaldoModel.contacto.email.text
                                  .size(16)
                                  .semiBold
                                  .color(Color(0xFF666666))
                                  .make(),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: 'Madre de Deus'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        pedidoSaldoModel.contacto.telemovel.text
                            .size(16)
                            .semiBold
                            .color(Color(0xFF666666))
                            .make(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    'Detalhe do Pedido'
                        .text
                        .size(20)
                        .center
                        .semiBold
                        .color(Color(0xFF666666))
                        .make(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: 'Seu saldo depois que ele(a) aceitar'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        '${(Get.find<AppController>().usuario.cliente.pessoa.saldo + (pedidoSaldoModel.quatidadeSaldo - (pedidoSaldoModel.quatidadeSaldo * .05))).toString().replaceAll('.', ',')} Dbs'
                            .text
                            .size(17)
                            .bold
                            .color(Color(0xFF3C63FE))
                            .make(),
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: 'Desconto'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        '${(pedidoSaldoModel.quatidadeSaldo * .05).toDoubleStringAsFixed(digit: 2).replaceAll('.', ',')} Dbs'
                            .text
                            .size(17)
                            .bold
                            .color(Color(0xFF3C63FE))
                            .make(),
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: 'Receberas'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        '${(pedidoSaldoModel.quatidadeSaldo - (pedidoSaldoModel.quatidadeSaldo * .05)).toString().replaceAll('.', ',')} Dbs'
                            .text
                            .size(17)
                            .bold
                            .color(Color(0xFF3C63FE))
                            .make(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonSeguinteEnviarWidget(
                textChild: 'Pedir',
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Confirmar Pedido',
                      onConfirm: () async {
                        if (await controller.pedir(pedidoSaldoModel)) {
                          enviadoComSucesso(pedidoSaldoModel);
                          Future.delayed(Duration(seconds: 2),
                              () => Get.offAllNamed(Routes.PEDIR));
                        }
                      },
                      onCancel: () {},
                      middleText:
                          'Tem certeza que queres pedir ${(pedidoSaldoModel.quatidadeSaldo - (pedidoSaldoModel.quatidadeSaldo * .05)).toString().replaceAll('.', ',')} Dbs ao ${pedidoSaldoModel.contacto.nome}',
                      textConfirm: 'Sim',
                      textCancel: 'Não');
                }),
          ],
        ),
      ),
    );
  }

  enviadoComSucesso(PedidoSaldoModel pedidoSaldoModel) {
    Get.rawSnackbar(
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF3CFEB5),
        messageText:
            'Seu pedido de ${(pedidoSaldoModel.quatidadeSaldo).toDoubleStringAsFixed().replaceAll('.', ',')} Dbs ao ${pedidoSaldoModel.contacto.nome} foi enviado com Sucesso'
                .text
                .color(Colors.white)
                .size(15)
                .bold
                .make(),
        borderRadius: 10,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20));
    Get.find<AppController>().refreshUsuario();
  }
}