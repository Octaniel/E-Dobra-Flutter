import 'package:edobra/app/widgets/custom_drawer.dart';
import 'package:edobra/app/widgets/text_input_pesquisa_widget.dart';
import 'package:edobra/app/widgets/tile_contato_widget.dart';

import '../controllers/solicitar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SolicitarPage extends GetView<SolicitarController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: 'Pedir'.text.size(20).semiBold.color(Color(0xFF495157)).make(),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputPesquisaWidget(
                onChanged: (value) => controller.filtrarContactos(value),
              ),
            ),
            SizedBox(height: 20),
            'Seu Contactos'
                .text
                .center
                .semiBold
                .color(Color(0xFF495157))
                .size(16)
                .make(),
            GetBuilder<SolicitarController>(builder: (_){
              return controller
                  .favorito
                  ? Container(
                height: 212,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 0.1, color: Color(0xFF3B3A3A))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    'Favoritos'
                        .text
                        .semiBold
                        .color(Color(0xFF495157).withOpacity(.85))
                        .size(18)
                        .make(),
                    GetBuilder<SolicitarController>(
                      builder: (_) {
                        return Column(
                          children: controller.contactosResumo
                              .map((e) => e.favorito
                              ? TileContatoWidget(
                              e, 'Pedir', Color(0xFF2B419C))
                              : Container())
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ):Container();
            }),
            SizedBox(height: 20),
            'Todos'
                .text
                .semiBold
                .color(Color(0xFF495157).withOpacity(.85))
                .size(18)
                .make(),
            GetBuilder<SolicitarController>(
              builder: (_) {
                return Column(
                  children: controller.contactosResumo
                      .map((e) =>
                      TileContatoWidget(e, 'Pedir', Color(0xFF2B419C)))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
