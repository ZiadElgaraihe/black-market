part of 'ingots_coins_model.dart';

class PriceModel {
  int id;
  double buyPrice;
  double sellPrice;

  PriceModel({
    required this.id,
    required this.buyPrice,
    required this.sellPrice,
  });

  factory PriceModel.fromJson({required Map<String, dynamic> data}) {
    return PriceModel(
      id: data['id'],
      buyPrice: (data['buy_price'] is int)
          ? data['buy_price'].toDouble()
          : data['buy_price'],
      sellPrice: (data['sell_price'] is int)
          ? data['sell_price'].toDouble()
          : data['sell_price'],
    );
  }
}
