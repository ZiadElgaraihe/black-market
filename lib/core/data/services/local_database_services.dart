import 'package:black_market/core/data/repos/local_database_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseServices implements LocalDatabaseRepo {
  LocalDatabaseServices({
    required FlutterSecureStorage flutterSecureStorage,
  }) {
    _flutterSecureStorage = flutterSecureStorage;
  }

  late FlutterSecureStorage _flutterSecureStorage;
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
  Future<void> storeInSecureStorage({
    required String key,
    required String value,
  }) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}
