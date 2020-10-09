class MovimentacaoResumoModel {
  int id;
  double quantidadeSaldo;
  String nomeUsuario;
  String tipoMovimentacao;
  String estilo;
  String nomeCliente;
  DateTime dataCriacao;

  MovimentacaoResumoModel(
      {this.id,
      this.quantidadeSaldo,
      this.nomeUsuario,
      this.tipoMovimentacao,
      this.estilo,
      this.nomeCliente,
      this.dataCriacao});

  MovimentacaoResumoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantidadeSaldo = json['quantidadeSaldo'];
    nomeUsuario = json['nomeUsuario'];
    tipoMovimentacao = json['tipoMovimentacao'];
    estilo = json['estilo'];
    dataCriacao = DateTime.parse(json['dataCriacao']);
    nomeCliente = json['nomeCliente'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'quantidadeSaldo': quantidadeSaldo,
      'nomeUsuario': nomeUsuario,
      'tipoMovimentacao': tipoMovimentacao,
      'estilo': estilo,
      'dataCriacao': dataCriacao,
      'nomeCliente': nomeCliente,
    };
  }
}
