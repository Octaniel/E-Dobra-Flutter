import 'package:edobra/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TileCustomDrawerWidget extends GetWidget<AppController> {
  final String nomeTela;
  final String caminho;
  final IconData icondata;

  TileCustomDrawerWidget(this.nomeTela, this.icondata, this.caminho);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.caminho = caminho;
        Get.offNamed(caminho);
      },
      child: Container(
        height: 50,
        child: GetBuilder<AppController>(
          builder: (_) {
            return Row(
              children: [
                SizedBox(width: 20),
                Icon(
                  icondata,
                  color: controller.caminho != caminho
                      ? Color(0xFF666666)
                      : Color(0xFF3C63FE),
                ),
                SizedBox(width: 20),
                controller.caminho != caminho
                    ? nomeTela.text.size(18).color(Color(0xFF666666)).make()
                    : nomeTela.text
                        .size(18)
                        .color(Color(0xFF3C63FE))
                        .semiBold
                        .make()
              ],
            );
          },
        ),
      ),
    );
  }
}
