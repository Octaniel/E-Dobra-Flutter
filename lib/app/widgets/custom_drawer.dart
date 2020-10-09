import 'package:edobra/app/app_controller.dart';
import 'package:edobra/app/modules/home/widgets/enviados_recentes_avatar_home_widget.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:edobra/app/widgets/tile_custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDrawer extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Color(0xFF3C63FE),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: GetBuilder(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 300),
                  Container(
                    child: EnviadosRecentesAvatarHomeWidget(
                        'Oc', null, Color(0xFF6A80D6)),
                    alignment: Alignment.centerLeft,
                    width: 60,
                  ),
                  SizedBox(height: 40),
                  controller.usuario.cliente.pessoa.nome.text
                      .size(18)
                      .semiBold
                      .white
                      .make(),
                  controller.usuario.cliente.pessoa.email.text
                      .size(15)
                      .white
                      .make(),
                  SizedBox(height: 30),
                ],
              );
            }),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 1.5,
            child: Column(
              children: [
                SizedBox(height: 10),
                TileCustomDrawerWidget('Home', Icons.home, Routes.HOME),
                Divider(),
                TileCustomDrawerWidget('Enviar', Icons.send, Routes.ENVIAR),
                Divider(),
                TileCustomDrawerWidget(
                    'Solicitar', Icons.request_page, Routes.PEDIR),
                Divider(),
                TileCustomDrawerWidget(
                    'Pagar', FontAwesomeIcons.sellcast, Routes.PAGAR),
                Divider(),
                Spacer(flex: 300),
                InkWell(
                  onTap: () async {
                    if(await controller.logout()){
                      Get.offAllNamed(Routes.LOGIN);
                    }
                  },
                  child: Container(
                    height: 41,
                    color: Color(0xFFFE3C3C),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.exit_to_app, color: Colors.white,),
                        SizedBox(width: 20),
                        'Sair'.text
                            .size(18)
                            .white
                            .make()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
