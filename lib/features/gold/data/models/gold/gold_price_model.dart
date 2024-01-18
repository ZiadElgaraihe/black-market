part of 'gold_model.dart';

class GoldPriceModel {
  int id;
  double buyPrice;
  double sellPrice;

  GoldPriceModel({
    required this.id,
    required this.buyPrice,
    required this.sellPrice,
  });

  factory GoldPriceModel.fromJson({required Map<String, dynamic> data}) {
    return GoldPriceModel(
      id: data['id'],
      buyPrice: (data['buy_price'] is int)
          ? data['buy_price'].toDouble()
          : data['buy_price'],
      sellPrice: (data['price'] is int) 
          ? data['price'].toDouble() 
          : data['price'],
    );
  }
}
