import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  //dio helper
  getIt.registerSingleton<DioHelper>(DioHelper());
}
