import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/data/model/movimentacao_resumo_model.dart';
import 'package:edobra/app/data/repository/contacto_repository.dart';
import 'package:edobra/app/data/repository/movimentacao_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
 final contactoRepository = ContactoRepository();
 final movimentoRepository = MovimentacaoRepository();

 var _contactosResumo = List<ContctoResumoModel>().obs;
 var _movimentoResumo = List<MovimentacaoResumoModel>().obs;

  HomeController(){
    listarContactosRecentes();
    listarMovimentacoesRecentes();
  }

 List<ContctoResumoModel> get contactosResumo => _contactosResumo.value;

  set contactosResumo(value) {
    _contactosResumo.value = value;
  }

 List<MovimentacaoResumoModel> get movimentoResumo => _movimentoResumo.value;

  set movimentoResumo(value) {
    _movimentoResumo.value = value;
  }

  listarContactosRecentes() async {
    contactosResumo = await contactoRepository.listarContactosRecentes();
    update();
 }

 listarMovimentacoesRecentes() async{
    movimentoResumo = await movimentoRepository.listarMovimentacoesRecentes();
    update();
 }

//TODO: HomeController
}
