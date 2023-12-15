import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/auth/data/models/user/user.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeLocalDatabase() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CurrencyModelAdapter());
  Hive.registerAdapter(CurrencyPriceModelAdapter());

  await Hive.openBox<User>(kUserBox);
  await Hive.openBox(kCurrencyBox);
}
