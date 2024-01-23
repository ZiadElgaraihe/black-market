import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:intl/intl_standalone.dart';

part 'package:black_market/core/data/services/localization_services.dart';

abstract class LocalizationRepo {
  // List of supported languages in app
  List<String> supportedLanguages = ['ar', 'en'];

  // Save language of the app in local database
  Future<void> saveNewLanguageInLocalDatabase({
    required String languageCode,
  });

  // Get the system language or use 'ar' (Arabic) as default
  Future<String> getSystemLanguage();

  // Get language from local database (if exists)
  Future<String?> getLanguageFromLocalDatabase();
}
