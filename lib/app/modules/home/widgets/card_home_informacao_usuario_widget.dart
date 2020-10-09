import 'package:edobra/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CardHomeInformacaoUsuarioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF3C63FE),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      child: GetBuilder<AppController>(builder: (appController){
        return Column(
          children: [
            appController.usuario.cliente.pessoa.nome.text.size(23).white.center.bold.make(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                appController.usuario.cliente.pessoa.morada.text.size(18).white.semiBold.make(),
                appController.usuario.cliente.pessoa.telemovel.text.size(18).white.semiBold.make(),
              ],
            ),
            SizedBox(height: 20),
            'SALDO E-DOBRA'.text.size(13).white.semiBold.make(),
            appController.usuario.cliente.pessoa.saldo.text.size(30).white.bold.make(),
          ],
        );
      },),
    );
  }
}
