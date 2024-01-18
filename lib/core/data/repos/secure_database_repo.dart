abstract class SecureDatabaseRepo{
  Future<void> storeInSecureStorage({
    required String key,
    required String value,
  });
}