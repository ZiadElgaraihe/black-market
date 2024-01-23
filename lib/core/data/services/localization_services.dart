part of 'package:black_market/core/data/repos/localization_repo.dart';

class LocalizationServices implements LocalizationRepo {
  LocalizationServices({
    required LocalDatabaseServices localDatabaseServices,
  }) {
    _localDatabaseServices = localDatabaseServices;
  }

  late LocalDatabaseServices _localDatabaseServices;

  // List of supported languages in app
  @override
  List<String> supportedLanguages = ['ar', 'en'];

  // Save language of the app in local database
  @override
  Future<void> saveNewLanguageInLocalDatabase({
    required String languageCode,
  }) async {
    await _localDatabaseServices.store<String>(
      boxName: kLanguageBox,
      key: kLanguageKey,
      value: languageCode,
    );
  }

  // Get the system language or use 'ar' (Arabic) as default
  @override
  Future<String> getSystemLanguage() async {
    String systemLanguage =
        await findSystemLocale().then((value) => value.split('_')[0]);
    String language =
        supportedLanguages.contains(systemLanguage) ? systemLanguage : 'ar';
    await saveNewLanguageInLocalDatabase(languageCode: language);

    return language;
  }

  // Get language from local database (if exists)
  @override
  Future<String?> getLanguageFromLocalDatabase() async {
    return await _localDatabaseServices.get<String?>(
      boxName: kLanguageBox,
      key: kLanguageKey,
    );
  }
}
