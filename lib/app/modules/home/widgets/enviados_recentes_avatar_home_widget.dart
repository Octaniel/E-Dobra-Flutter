import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EnviadosRecentesAvatarHomeWidget extends StatelessWidget {
  final String abreviaturaNomeContacto;
  final String nomeContacto;
  final Color color;

  EnviadosRecentesAvatarHomeWidget(
      this.abreviaturaNomeContacto, this.nomeContacto, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: nomeContacto!=null?EdgeInsets.only(right: 10):EdgeInsets.only(right: 0),
            height: 59,
            width: 59,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
            child: Center(
                child: abreviaturaNomeContacto.text.italic.light
                    .size(29)
                    .white
                    .make()),
          ),
        ),
        nomeContacto != null
            ? nomeContacto.text
                .size(18)
                .color(Color(0xFF444444).withOpacity(.7))
                .make()
            : Container(),
      ],
    );
  }
}
