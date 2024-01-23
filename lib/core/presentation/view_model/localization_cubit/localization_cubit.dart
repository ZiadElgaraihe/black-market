import 'package:black_market/core/data/repos/localization_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit({
    required LocalizationServices localizationServices,
  }) : super(LocalizationInitial()) {
    _localizationServices = localizationServices;
    appLocale = const Locale('ar');
    supportedLanguages = localizationServices.supportedLanguages;
  }

  late LocalizationServices _localizationServices;
  late Locale appLocale;

  // List of supported languages in app
  late List<String> supportedLanguages;

  bool isArabic() {
    return appLocale.languageCode == 'ar';
  }

  // Change language of the app
  Future<void> changeCurrentLanguage({required String languageCode}) async {
    appLocale = Locale(languageCode);
    await _localizationServices.saveNewLanguageInLocalDatabase(
      languageCode: languageCode,
    );
    emit(LocalizationInitial());
  }

  // Set the language of the app
  // get it from local database (if user already chose language)
  // get it from device system (if user didn't choose language)
  Future<void> setUpAppLanguage() async {
    appLocale = Locale(
      await _localizationServices.getLanguageFromLocalDatabase() ??
          await _localizationServices.getSystemLanguage(),
    );
    emit(LocalizationInitial());
  }
}
