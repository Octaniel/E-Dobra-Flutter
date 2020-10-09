import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TileContatoWidget extends StatelessWidget {
  final ContctoResumoModel contactoResumo;
  final String objetivo;
  final Color colorLogo;

  TileContatoWidget(this.contactoResumo, this.objetivo, this.colorLogo);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 53,
          height: 42,
          decoration: ShapeDecoration(
            color: colorLogo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child:
          contactoResumo.nome.substring(0,2).text.center.italic.light.size(29).white.make(),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          width: 245,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contactoResumo.nome
                  .text
                  .size(16)
                  .semiBold
                  .color(Color(0xFF666666))
                  .make(),
              contactoResumo.email
                  .text
                  .size(14)
                  .semiBold
                  .color(Color(0xFF666666))
                  .make(),
            ],
          ),
        ),
        Spacer(flex: 300),
        InkWell(
          onTap: (){
            objetivo=='Pedir'?
            Get.toNamed(Routes.SALDOPEDIDO, arguments: contactoResumo):
            Get.toNamed(Routes.SALDOENVIO, arguments: contactoResumo);
          },
          child: Container(
            width: 49,
            height: 21,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(width: 0.1, color: Color(0xFF3B3A3A))
              ),
            ),
            child: Center(child: objetivo.text.size(12).semiBold.color(Color(0xFF666666)).make()),
          ),
        ),
      ],
    );
  }
}
