import 'package:edobra/app/data/model/pessoa_model.dart';

class MovimentacaoModel{
   double quantidadeSaldo;
   PessoaModel cliente;
   String descricao;
   String tipoMovimentacao;
   String estilo;

   MovimentacaoModel({this.quantidadeSaldo, this.cliente, this.descricao,
      this.tipoMovimentacao, this.estilo});

   Map<String, dynamic> toJson() {
      return <String, dynamic>{
         'quantidadeSaldo': quantidadeSaldo,
         'cliente': cliente.toJsonEstandoDentro(),
         'descricao': descricao,
         'tipoMovimentacao': tipoMovimentacao,
         'estilo': estilo
      };
   }
}