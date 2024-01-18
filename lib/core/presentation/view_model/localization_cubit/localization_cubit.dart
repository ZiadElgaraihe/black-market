import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl_standalone.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit({required LocalDatabaseServices localDatabaseServices})
      : super(LocalizationInitial()) {
    _localDatabaseServices = localDatabaseServices;
    appLocale = const Locale('ar');
  }

  late LocalDatabaseServices _localDatabaseServices;
  late Locale appLocale;

  // List of supported languages in app
  List<String> supportedLanguages = ['ar', 'en'];

  bool isArabic() {
    return appLocale.languageCode == 'ar';
  }

  // Change language of the app
  Future<void> changeCurrentLanguage({required String languageCode}) async {
    appLocale = Locale(languageCode);
    await _localDatabaseServices.store<String>(
      boxName: kLanguageBox,
      key: kLanguageKey,
      value: languageCode,
    );
    emit(LocalizationInitial());
  }

  // Set the language of the app
  // get it from local database (if user already chose language)
  // get it from device system (if user didn't choose language)
  Future<void> setUpAppLanguage() async {
    appLocale = Locale(
      await _getLanguageFromLocalDatabase() ?? await _getSystemLanguage(),
    );
    emit(LocalizationInitial());
  }

  // Get the system language or use 'ar' (Arabic) as default
  Future<String> _getSystemLanguage() async {
    String systemLanguage =
        await findSystemLocale().then((value) => value.split('_')[0]);
    return supportedLanguages.contains(systemLanguage) ? systemLanguage : 'ar';
  }

  // Get language from local database (if exists)
  Future<String?> _getLanguageFromLocalDatabase() async {
    return await _localDatabaseServices.get<String?>(
      boxName: kLanguageBox,
      key: kLanguageKey,
    );
  }
}
