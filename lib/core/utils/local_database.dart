import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/auth/data/models/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

initializeLocalDatabase() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  await Hive.openBox<User>(kUserBox);
}
