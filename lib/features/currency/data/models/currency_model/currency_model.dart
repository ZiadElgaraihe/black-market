import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/data/models/filter_price_model/filter_price_model.dart';
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
  List<FilterPriceModel>? livePrices;
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
    required this.blackMarketPrices,
    required this.bankPrices,
  });

  factory CurrencyModel.fromJson({required Map<String, dynamic> data}) {
        Set<int> uniqueBankIds = <int>{};

    List<CurrencyPriceModel?> bankPrices = List.generate(
      data['bank_prices'].length,
      (index) {
        int bankId = data['bank_prices'][index]['bank_id'];

        // Check if the bank ID is unique
        if (uniqueBankIds.contains(bankId)) {
          return null; // Skip duplicate entry
        }

        uniqueBankIds.add(bankId); // Add the bank ID to the Set

        return CurrencyPriceModel.fromJson(
          data: data['bank_prices'][index],
        );
      },
    );

    // Remove null entries (skipped duplicates)
    bankPrices.removeWhere((element) => element == null);
    
    return CurrencyModel(
      id: data['id'],
      icon: 'http://www.voipsys.space/storage/${data['icon']}',
      name: data['name'],
      code: data['code'],
      updatedAt: data['updated_at'],
      blackMarketPrices: List.generate(
        data['black_market_prices'].length,
        (index) => CurrencyPriceModel.fromJson(
          data: data['black_market_prices'][index],
        ),
      ),
      bankPrices: List.generate(
        bankPrices.length,
        (index) => bankPrices[index]!,
      ),
    );
  }
}
