class CurrencyPriceModel {
  int id;
  int? bankId;
  double buyPrice;
  double sellPrice;
  String updatedAt;

  CurrencyPriceModel({
    required this.id,
    this.bankId,
    required this.buyPrice,
    required this.sellPrice,
    required this.updatedAt,
  });

  factory CurrencyPriceModel.fromJson({required Map<String, dynamic> data}) {
    return CurrencyPriceModel(
      id: data['id'],
      bankId: data['bank_id'],
      buyPrice: data['buy_price'],
      sellPrice: data['sell_price'],
      updatedAt: data['updated_at'],
    );
  }
}
