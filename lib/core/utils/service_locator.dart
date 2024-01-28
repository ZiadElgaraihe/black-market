import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:black_market/features/notifications/data/repos/articles_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  //dio helper
  getIt.registerSingleton<DioHelper>(DioHelper());

  //flutter secure storage
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  //connection services
  getIt.registerSingleton<ConnectionServices>(ConnectionServices());

  //local database services
  getIt.registerSingleton<LocalDatabaseServices>(LocalDatabaseServices());

  //secure database services
  getIt.registerSingleton<SecureDatabaseServices>(
    SecureDatabaseServices(
      flutterSecureStorage: getIt<FlutterSecureStorage>(),
    ),
  );

  //auth services
  getIt.registerSingleton<AuthServices>(
    AuthServices(
      dioHelper: getIt<DioHelper>(),
    ),
  );

  //articles services
  getIt.registerSingleton<ArticlesServices>(
    ArticlesServices(
      dioHelper: getIt<DioHelper>(),
    ),
  );
}
