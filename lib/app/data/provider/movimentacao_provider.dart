import 'dart:convert';

import 'package:edobra/app/data/model/movimentacao_model.dart';
import 'package:edobra/app/data/model/movimentacao_resumo_model.dart';
import 'package:edobra/app/res/fatura_http.dart';
import 'package:edobra/app/res/static.dart';

class MovimentacaoProvider{
  final httpfat = FaturaHttp();

  Future<List<MovimentacaoResumoModel>> listarMovimentacoesRecentes() async {
    final response =
    await httpfat.get("${url}movimentacao?page=0&size=10000",headers: <String,String>{
      "Content-Type":"application/json"
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(decoder(response.body))['content'];
      var listUsuarioModel = jsonResponse.map<MovimentacaoResumoModel>((map) {
        return MovimentacaoResumoModel.fromJson(map);
      }).toList();
      return listUsuarioModel;
    } else {
      print(response.body);
      print("object");
    }
    return List<MovimentacaoResumoModel>();
  }

  Future<bool> transferir(MovimentacaoModel movimentacaoModel)async{
    final response =
    await httpfat.post("${url}movimentacao/transferir",headers: <String,String>{
      "Content-Type":"application/json"
    },body: json.encode(movimentacaoModel));
    if (response.statusCode == 201) {
      return true;
    } else {
      print("object");
      return false;
    }
  }
}