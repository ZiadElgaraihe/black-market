import 'package:black_market/core/data/repos/local_database_repo.dart';
import 'package:black_market/core/utils/constants.dart';
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
  Future<void> store<E>({
    required String boxName,
    required String key,
    required E value,
  }) async {
    Box box = Hive.box(kUserBox);
    await box.put('key', value);
  }

  @override
  Future<void> storeInSecureStorage({
    required String key,
    required String value,
  }) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}
