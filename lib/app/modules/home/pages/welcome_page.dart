import 'package:edobra/app/data/provider/seguranca_provider.dart';
import 'package:edobra/app/modules/home/controllers/home_controller.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app_controller.dart';

class WelcomePage extends GetView<HomeController> {

  Future verificarToken()async{
    if (await SegurancaProvider().verificarERenovarToken()){
      await Get.find<AppController>().refreshUsuario();
      Get.offAllNamed(Routes.HOME);
    }else{
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() {
      verificarToken();
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'image/icon.png',
            height: 86,
            width: 86,
          ),
          SizedBox(
            height: 10,
          ),
          'BEM VINDO AO'.text.size(22).bold.make(),
          'E-Dobra'.text.size(40).semiBold.make(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child:
                '''O seu aplicativo de transações online em dobra. Vamos prepará-lo para enviar, gastar e muito mais.'''
                    .text
                    .size(25)
                    .center
                    .make(),
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
