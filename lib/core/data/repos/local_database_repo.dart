import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';

abstract class LocalDatabaseRepo {
  Future<void> store<T>({
    required String boxName,
    required String key,
    required T value,
  });

  Future<void> addToList<T>({
    required String boxName,
    required String key,
    required T value,
  });

  Future<T> get<T>({
    required String boxName,
    required String key,
  });

  Future<void> delete<T>({
    required String boxName,
    required String key,
  });

  Future<void> deleteFromList({
    required String boxName,
    required String key,
    required CurrencyPriceModel value,
  });
}
