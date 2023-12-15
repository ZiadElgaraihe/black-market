import 'package:black_market/core/data/repos/secure_database_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureDatabaseServices implements SecureDatabaseRepo {
  SecureDatabaseServices({
    required FlutterSecureStorage flutterSecureStorage,
  }) {
    _flutterSecureStorage = flutterSecureStorage;
  }

  late FlutterSecureStorage _flutterSecureStorage;
  
  @override
  Future<void> storeInSecureStorage({
    required String key,
    required String value,
  }) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}
