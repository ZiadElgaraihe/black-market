import 'package:black_market/core/data/repos/local_database_repo.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseServices implements LocalDatabaseRepo {
  @override
  Future<void> store<E>({
    required String boxName,
    required String key,
    required E value,
  }) async{
    Box box = Hive.box(kUserBox);
    await box.put('key', value);
  }
}
