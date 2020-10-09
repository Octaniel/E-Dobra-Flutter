import 'dart:convert';

import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/res/fatura_http.dart';
import 'package:edobra/app/res/static.dart';

class ContactoProvider{
  final httpfat = FaturaHttp();

  Future<List<ContctoResumoModel>> listarContactosRecentes() async {
    final response =
    await httpfat.get("${url}movimentacao/contactosRecentes",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(decoder(response.body));
      var listUsuarioModel = jsonResponse.map<ContctoResumoModel>((map) {
        return ContctoResumoModel.fromJson(map);
      }).toList();
      return listUsuarioModel;
    } else {
      print('erro -get');
    }
    return List<ContctoResumoModel>();
  }

  Future<List<ContctoResumoModel>> listarContactos(String nome, String email) async {
    final response =
    await httpfat.get("${url}contacto",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(decoder(response.body))['content'];
      var listUsuarioModel = jsonResponse.map<ContctoResumoModel>((map) {
        return ContctoResumoModel.fromJson(map);
      }).toList();
      return listUsuarioModel;
    } else {
      print('erro -get');
    }
    return List<ContctoResumoModel>();
  }
}