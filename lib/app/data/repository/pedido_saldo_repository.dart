import 'package:edobra/app/data/model/pedido_saldo_model.dart';
import 'package:edobra/app/data/provider/pedido_saldo_provider.dart';

class PedidoSaldoRepository{
  final pedidoSaldoProvider = PedidoSaldoProvider();

  Future<bool> salvar(PedidoSaldoModel obj) async {
    return pedidoSaldoProvider.salvar(obj);
  }
}