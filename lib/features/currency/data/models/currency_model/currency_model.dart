import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 1)
class CurrencyModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String icon;
  @HiveField(2)
  String name;
  @HiveField(3)
  String code;
  @HiveField(4)
  String updatedAt;
  @HiveField(5)
  List<CurrencyPriceModel> livePrices;
  @HiveField(6)
  List<CurrencyPriceModel> blackMarketPrices;
  @HiveField(7)
  List<CurrencyPriceModel> bankPrices;

  CurrencyModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.code,
    required this.updatedAt,
    required this.livePrices,
    required this.blackMarketPrices,
    required this.bankPrices,
  });

  factory CurrencyModel.fromJson({required Map<String, dynamic> data}) {
    return CurrencyModel(
      id: data['id'],
      icon: data['icon'],
      name: data['name'],
      code: data['code'],
      updatedAt: data['updated_at'],
      livePrices: List.generate(
        data['live_prices'].length,
        (index) =>
            CurrencyPriceModel.fromJson(data: data['live_prices'][index]),
      ),
      blackMarketPrices: List.generate(
        data['black_market_prices'].length,
        (index) => CurrencyPriceModel.fromJson(
          data: data['black_market_prices'][index],
        ),
      ),
      bankPrices: List.generate(
        data['bank_prices'].length,
        (index) => CurrencyPriceModel.fromJson(
          data: data['bank_prices'][index],
        ),
      ),
    );
  }
}
