import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/utils/constants.dart';

part 'package:black_market/features/profile/data/services/log_out_services.dart';

abstract class LogOutRepo {
  Future<void> logOut();
}
