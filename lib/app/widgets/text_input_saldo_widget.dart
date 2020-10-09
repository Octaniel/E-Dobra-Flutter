import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextInputSaldoWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController textEditingController;

  const TextInputSaldoWidget({Key key, this.hintText, this.onChanged, this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.5, color: Color(0xFF707070).withOpacity(.78)),
              borderRadius: BorderRadius.circular(6)),
        ),
        child: TextFormField(
          style: TextStyle(
              color: Color(0xFF585858).withOpacity(.83),
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 6,bottom: 2),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF585858).withOpacity(.83),
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
            focusedBorder:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(6)),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(6)),
            prefixIcon: 'Dbs'
                .text
                .center
                .color(Color(0xFF585858).withOpacity(.83))
                .size(20)
                .semiBold
                .make()
                .box
                .margin(EdgeInsets.only(top: 7))
                .make(),
          ),
        ));
  }
}
