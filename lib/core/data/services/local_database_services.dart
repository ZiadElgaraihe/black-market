import 'package:black_market/core/data/repos/local_database_repo.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseServices implements LocalDatabaseRepo {
  @override
  Future<void> store<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    Box box = await Hive.openBox<T>(boxName);
    await box.put(key, value);
    await box.close();
  }

  @override
  Future<void> addToList<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    Box box = await Hive.openBox(boxName);

    // Check if the key already exists in the box
    if (box.containsKey(key)) {
      // Retrieve the existing value
      var returnedData = box.get(key);

      List<T> existingList = [];

      if (returnedData != null) {
        for (var element in returnedData) {
          existingList.add(element);
        }
      }

      // Modify the existing value by adding the new value
      existingList.add(value);

      // Store the modified value back
      await box.put(key, existingList);
    } else {
      // If the key doesn't exist, store the value as a new list
      await box.put(key, [value]);
    }

    await box.close();
  }

  @override
  Future<T> get<T>({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox<T>(boxName);
    T data = box.get(key);
    await box.close();
    return data;
  }

  @override
  Future<void> delete<T>({
    required String boxName,
    required String key,
  }) async {
    Box box = await Hive.openBox<T>(boxName);
    await box.delete(key);
    await box.close();
  }

  @override
  Future<void> deleteFromList({
    required String boxName,
    required String key,
    required CurrencyPriceModel value,
  }) async {
    Box box = await Hive.openBox(boxName);

    // Retrieve the existing value
    var returnedData = box.get(key);

    if (returnedData != null && returnedData.length != 1) {
      List<CurrencyPriceModel> existingList = [];

      if (returnedData != null) {
        for (var element in returnedData) {
          if (element.id == value.id) {
            continue;
          }
          existingList.add(element);
        }
      }

      // Store the modified value back
      await box.put(key, existingList);
    } else {
      await box.delete(key);
    }

    await box.close();
  }
}
