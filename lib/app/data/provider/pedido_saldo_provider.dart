import 'dart:convert';

import 'package:edobra/app/data/model/pedido_saldo_model.dart';
import 'package:edobra/app/res/fatura_http.dart';
import 'package:edobra/app/res/static.dart';

class PedidoSaldoProvider {
  final httpfat = FaturaHttp();

  Future<bool> salvar(PedidoSaldoModel obj) async {
    var response = await httpfat.post('${url}pedidoSaldo',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
    if (response.statusCode == 201) {
      return true;
    } else {
      print('erro -post');
    }
    return false;
  }
}
