import 'package:edobra/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonSeguinteEnviarWidget extends StatelessWidget {

  final String textChild;
  final Function() onPressed;

  const ButtonSeguinteEnviarWidget({Key key, this.textChild, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width/2-80),
        height: 36,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
          ),
          color: Color(0xFF3C63FE),
          onPressed: onPressed,
          child: textChild.text.size(16).bold.white.make(),
        )
    );
  }
}
