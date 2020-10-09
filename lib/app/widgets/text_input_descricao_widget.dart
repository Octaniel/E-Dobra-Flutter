import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextInputDescricaoWidget extends StatelessWidget {
  final Function(String) onChanged;

  const TextInputDescricaoWidget({Key key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 10),
        height: 92,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.5, color: Color(0xFF707070).withOpacity(.78)),
              borderRadius: BorderRadius.circular(6)),
        ),
        child: TextFormField(
          onChanged: onChanged,
          maxLines: 3,
          style: TextStyle(
              color: Color(0xFF585858).withOpacity(.83),
              fontSize: 20,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: 'Descrição',
            hintStyle: TextStyle(
                color: Color(0xFF585858).withOpacity(.83),
                fontSize: 20,
                fontWeight: FontWeight.w600),
            contentPadding: EdgeInsets.only(top: 6,bottom: 2),
            focusedBorder:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(6)),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(6)),
            prefixIcon: Container(
                margin: EdgeInsets.only(bottom: 45),
                child: Icon(
              Icons.description,
              color: Color(0xFF585858).withOpacity(.83),
            )),
          ),
        ));
  }
}
