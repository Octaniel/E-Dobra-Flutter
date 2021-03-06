
import 'dart:convert';

import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:edobra/app/data/repository/seguranca_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FaturaHttp{

  final seguranca = SegurancaRepository();


Future<Response> get(url, {Map<String, String> headers}) =>
    _withClient((h) => http.get(url, headers: h),headers);

    Future<Response> post(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((h) =>
        http.post(url, headers: h, body: body, encoding: encoding),headers);

        Future<Response> put(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((h) =>
        http.put(url, headers: h, body: body, encoding: encoding),headers);

        Future<Response> delete(url, {Map<String, String> headers}) =>
    _withClient((h) => http.delete(url, headers: h),headers);


  Future<T> _withClient<T>(Future<T> Function(Map<String, String> headers) fn,Map<String, String> headers) async {
    final storage = await LocalStorage.getInstance();
    var accsessTokenExpirado = await seguranca.accsessTokenExpirado();
    if(accsessTokenExpirado){
      await seguranca.refreshToken();
       accsessTokenExpirado = await seguranca.accsessTokenExpirado();
     if(accsessTokenExpirado){
       return null;
    }
    }
    var read = storage.getString("access_token");
    if(headers==null){
      headers = Map();
    }
    headers.addAll(<String,String>{
      "Authorization":"Bearer "+read,
    });
    return fn(headers);
  }
   
}