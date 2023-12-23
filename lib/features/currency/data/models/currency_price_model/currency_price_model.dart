import 'package:hive_flutter/hive_flutter.dart';

part 'currency_price_model.g.dart';

@HiveType(typeId: 2)
class CurrencyPriceModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  int? bankId;
  @HiveField(2)
  double? price;
  @HiveField(3)
  double? buyPrice;
  @HiveField(4)
  double? sellPrice;
  @HiveField(5)
  String updatedAt;
  @HiveField(6)
  String? bankName;

  CurrencyPriceModel({
    required this.id,
    this.bankId,
    this.price,
    this.buyPrice,
    this.sellPrice,
    required this.updatedAt,
  });

  factory CurrencyPriceModel.fromJson({required Map<String, dynamic> data}) {
    return CurrencyPriceModel(
      id: data['id'],
      bankId: data['bank_id'],
      price: data['price'] is int ? data['price'].toDouble() : data['price'],
      buyPrice: data['buy_price'] is int
          ? data['buy_price'].toDouble()
          : data['buy_price'],
      sellPrice: data['sell_price'] is int
          ? data['sell_price'].toDouble()
          : data['sell_price'],
      updatedAt: data['updated_at'],
    );
  }
}
