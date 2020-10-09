import 'package:edobra/app/modules/home/widgets/card_home_informacao_usuario_widget.dart';
import 'package:edobra/app/modules/home/widgets/enviados_recentes_avatar_home_widget.dart';
import 'package:edobra/app/modules/home/widgets/ultimas_tranzacoes_tile_home_widget.dart';
import 'package:edobra/app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: 'Home'.text.size(20).semiBold.color(Color(0xFF495157)).make(),
        centerTitle: true,
        actions: [
          Container(
            height: 30,
            width: 40,
            margin: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(90),
              child: Icon(
                Icons.notifications_active,
                color: Color(0xFF495157),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              CardHomeInformacaoUsuarioWidget(),
              SizedBox(height: 40),
              'ENVIO RECENTE'
                  .text
                  .size(14)
                  .color(Color(0xFF666666))
                  .bold
                  .make(),
              SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (_) {
                  return Row(
                      children: controller.contactosResumo != null
                          ? controller.contactosResumo
                              .map((e) => EnviadosRecentesAvatarHomeWidget(
                                  e.nome.substring(0, 2),
                                  e.nome,
                                  Color(0xFF3C5DDE)))
                              .toList()
                          : []);
                },
              ),
              SizedBox(height: 20),
              'ULTIMAS TRANSAÇÕES'
                  .text
                  .size(14)
                  .color(Color(0xFF666666))
                  .bold
                  .make(),
              SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (_) {
                  var f = new DateFormat('dd/MM/yyyy');
                  return Column(
                    children: controller.movimentoResumo != null
                        ? controller.movimentoResumo
                            .map((e) => Container(
                                  width: 500,
                                  child: Column(
                                    children: [
                                      UltimasTranzacoesTileHomeWidget(
                                          e.nomeCliente,
                                          f.format(e.dataCriacao),
                                          e.tipoMovimentacao == 'DEBITO'
                                              ? '-${e.quantidadeSaldo} Dbs'
                                              : '+${e.quantidadeSaldo} Dbs'),
                                      Divider(),
                                    ],
                                  ),
                                ))
                            .toList()
                        : [],
                  );
                },
              ),
            ],
          )),
    );
  }
}
