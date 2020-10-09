import 'package:edobra/app/data/model/movimentacao_model.dart';
import 'package:edobra/app/data/model/movimentacao_resumo_model.dart';
import 'package:edobra/app/data/provider/movimentacao_provider.dart';

class MovimentacaoRepository{
  final movimentoProvider = MovimentacaoProvider();

  Future<List<MovimentacaoResumoModel>> listarMovimentacoesRecentes() async{
    return await movimentoProvider.listarMovimentacoesRecentes();
  }

  Future<bool> transferir(MovimentacaoModel movimentacaoModel)async{
    return await movimentoProvider.transferir(movimentacaoModel);
  }
}