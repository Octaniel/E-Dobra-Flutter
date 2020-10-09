import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class UltimasTranzacoesTileHomeWidget extends StatelessWidget {
  final String nomeContacto;
  final String dataTranzacao;
  final String quantidadeTranzacao;

  UltimasTranzacoesTileHomeWidget(
      this.nomeContacto, this.dataTranzacao, this.quantidadeTranzacao);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: Get.width*.65,
                alignment: Alignment.centerLeft,
                child: nomeContacto
                    .text
                    .size(20)
                    .color(Color(0xFF666666))
                    .semiBold
                    .make(),
              ),
              Container(
                width: Get.width*.65,
                alignment: Alignment.centerLeft,
                child: dataTranzacao
                    .text
                    .size(15)
                    .color(Color(0xFF666666))
                    .semiBold
                    .make(),
              ),
            ],
          ),
          Spacer(flex: 1215,),
          quantidadeTranzacao
              .text
              .size(20)
              .color(Color(0xFF666666))
              .semiBold
              .make(),
        ],
      ),
    );
  }
}
