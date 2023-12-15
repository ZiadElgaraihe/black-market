abstract class LocalDatabaseRepo {
  Future<void> store<T>({
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
}
