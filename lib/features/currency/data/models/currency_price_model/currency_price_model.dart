import 'package:hive_flutter/hive_flutter.dart';

part 'currency_price_model.g.dart';

@HiveType(typeId: 2)
class CurrencyPriceModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  int? bankId;
  @HiveField(2)
  double buyPrice;
  @HiveField(3)
  double sellPrice;
  @HiveField(4)
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
