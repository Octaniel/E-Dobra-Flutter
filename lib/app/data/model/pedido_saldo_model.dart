import 'package:edobra/app/data/model/pessoa_model.dart';

class PedidoSaldoModel{
   int id;
   PessoaModel contacto;
   PessoaModel usuario;
   double quatidadeSaldo;
   String descricao;

   Map<String, dynamic> toJson() {
      return <String, dynamic>{
         'id': id,
         'contacto': contacto.toJsonEstandoDentro(),
         'quatidadeSaldo': quatidadeSaldo,
         'descricao': descricao,
      };
   }
}