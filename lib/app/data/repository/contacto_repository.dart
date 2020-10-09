import 'package:edobra/app/data/model/contacto_resumo_model.dart';
import 'package:edobra/app/data/provider/contacto_provider.dart';

class ContactoRepository{
  final contactoProvider = ContactoProvider();

  Future<List<ContctoResumoModel>> listarContactosRecentes() async {
    return await contactoProvider.listarContactosRecentes();
  }

  Future<List<ContctoResumoModel>> listarContactos(String nome, String email) async {
    return await contactoProvider.listarContactos(nome, email);
  }
}