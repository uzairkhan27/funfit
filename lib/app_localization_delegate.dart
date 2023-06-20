import 'package:flutter/cupertino.dart';
import 'package:funfit/app_localization.dart';

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "hi", "es", "zh"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;

}
