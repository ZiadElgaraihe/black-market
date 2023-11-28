import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  //dio helper
  getIt.registerSingleton<DioHelper>(DioHelper());

  //connection services
  getIt.registerSingleton<ConnectionServices>(ConnectionServices());

  //auth services
  getIt.registerSingleton<AuthServices>(
    AuthServices(
      dioHelper: getIt<DioHelper>(),
    ),
  );
}
