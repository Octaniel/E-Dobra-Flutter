import 'package:edobra/app/app_controller.dart';
import 'package:edobra/app/data/model/movimentacao_model.dart';
import 'package:edobra/app/modules/enviar/controllers/enviar_controller.dart';
import 'package:edobra/app/modules/home/widgets/enviados_recentes_avatar_home_widget.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:edobra/app/widgets/button_seginte_enviar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ConcluirEnvioPage extends GetView<EnviarController> {
  @override
  Widget build(BuildContext context) {
    MovimentacaoModel movimentacao = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: 'Concluir Envio'
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
                            movimentacao.cliente.nome.substring(0, 2),
                            null,
                            Color(0xFF2B419C)),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 245,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              movimentacao.cliente.nome.text
                                  .size(18)
                                  .bold
                                  .color(Color(0xFF666666))
                                  .make(),
                              movimentacao.cliente.email.text
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
                        movimentacao.cliente.telemovel.text
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
                    'Detalhe da Tranzação'
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
                          child: 'Seu saldo depois da Tranzação'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        '${(Get.find<AppController>().usuario.cliente.pessoa.saldo - movimentacao.quantidadeSaldo).toString().replaceAll('.', ',')} Dbs'
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
                        '${(movimentacao.quantidadeSaldo * .05).toDoubleStringAsFixed(digit: 2).replaceAll('.', ',')} Dbs'
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
                          child: 'Será Enviado'
                              .text
                              .size(16)
                              .semiBold
                              .color(Color(0xFF666666))
                              .make(),
                        ),
                        Spacer(flex: 300),
                        '${(movimentacao.quantidadeSaldo - (movimentacao.quantidadeSaldo * .05)).toString().replaceAll('.', ',')} Dbs'
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
                textChild: 'ENVIAR',
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Confirmar Envio',
                      onConfirm: () async {
                        if( await controller.transferir(movimentacao)){
                          enviadoComSucesso(movimentacao);
                          Future.delayed(Duration(seconds: 2),()=>Get.offAllNamed(Routes.ENVIAR));
                        }
                      },
                      onCancel: () {},
                      middleText:
                          'Tem certeza que queres enviar ${(movimentacao.quantidadeSaldo - (movimentacao.quantidadeSaldo * .05)).toString().replaceAll('.', ',')} Dbs para ${movimentacao.cliente.nome}',
                      textConfirm: 'Sim',
                      textCancel: 'Não');
                }),
          ],
        ),
      ),
    );
  }

  enviadoComSucesso(MovimentacaoModel movimentacaoModel) {
    Get.rawSnackbar(
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF3CFEB5),
        messageText:
        'Enviado ${(movimentacaoModel.quantidadeSaldo).toDoubleStringAsFixed().replaceAll('.', ',')} Dbs para ${movimentacaoModel.cliente.nome} com Sucesso'
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
