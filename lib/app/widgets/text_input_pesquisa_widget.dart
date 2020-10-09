import 'package:flutter/material.dart';

class TextInputPesquisaWidget extends StatelessWidget {
  final Function(String) onChanged;

  const TextInputPesquisaWidget({Key key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.only(left: 10),
        decoration: ShapeDecoration(
          color: Color(0xFFEFF0F2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Nome ou E-mail',
            focusedBorder:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF3C63FE),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
