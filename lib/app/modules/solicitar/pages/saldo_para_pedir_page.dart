import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/data/model/movimentacao_model.dart';
import 'package:edobra/app/data/model/pedido_saldo_model.dart';
import 'package:edobra/app/data/model/pessoa_model.dart';
import 'package:edobra/app/modules/enviar/controllers/enviar_controller.dart';
import 'package:edobra/app/modules/solicitar/controllers/solicitar_controller.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:edobra/app/widgets/button_seginte_enviar_widget.dart';
import 'package:edobra/app/widgets/text_input_descricao_widget.dart';
import 'package:edobra/app/widgets/text_input_saldo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app_controller.dart';

// ignore: must_be_immutable
class SaldoParaPedidoPage extends GetView<SolicitarController> {
  var pedidoSaldoModel = PedidoSaldoModel();
  TextEditingController textEditingControllerPedes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContctoResumoModel contacto = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: 'Saldo para Solicitar'
            .text
            .size(20)
            .semiBold
            .color(Color(0xFF495157))
            .make(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              'Saldo'.text.color(Color(0xFF585858)).size(20).semiBold.make(),
              TextInputSaldoWidget(
                hintText: 'Pedes',
                onChanged: (value) {
                  var valueParse = double.parse(value);
                  pedidoSaldoModel.quatidadeSaldo = valueParse;
                },
                textEditingController: textEditingControllerPedes,
              ),
              SizedBox(
                height: 30,
              ),
              'Descrição'
                  .text
                  .color(Color(0xFF585858))
                  .size(20)
                  .semiBold
                  .make(),
              TextInputDescricaoWidget(
                onChanged: (value) => pedidoSaldoModel.descricao = value,
              ),
              SizedBox(
                height: 15,
              ),
              ButtonSeguinteEnviarWidget(
                textChild: 'SEGUINTE',
                onPressed: () {
                  if (pedidoSaldoModel.quatidadeSaldo == null) {
                    Get.rawSnackbar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xFFFE3C3C),
                        messageText:
                            'Deves preencher o saldo para efetuar o pedido'
                                .text
                                .color(Colors.white)
                                .size(15)
                                .bold
                                .make(),
                        borderRadius: 10,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20));
                  } else {
                    pedidoSaldoModel.contacto = PessoaModel(
                        id: contacto.id,
                        email: contacto.email,
                        telemovel: contacto.telemovel,
                        nome: contacto.nome);
                    Get.toNamed(Routes.CONCLUIRPEDIDO, arguments: pedidoSaldoModel);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
