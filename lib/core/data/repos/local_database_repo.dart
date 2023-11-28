abstract class LocalDatabaseRepo {
  Future<void> store<E>({
    required String boxName,
    required String key,
    required E value,
  });
}
