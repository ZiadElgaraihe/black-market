import 'package:black_market/features/currency/data/models/currency_price_model.dart';

class CurrencyModel {
  int id;
  String icon;
  String name;
  String code;
  String updatedAt;
  List<CurrencyPriceModel> livePrices;
  List<CurrencyPriceModel> blackMarketPrices;
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
