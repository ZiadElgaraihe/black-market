abstract class SecureDatabaseRepo {
  Future<void> storeInSecureStorage({
    required String key,
    required String value,
  });

  Future<String?> getFromSecureStorage({
    required String key,
  });

  Future<void> deleteFromSecureStorage({
    required String key,
  });
}
