import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  late final Locale _locale;

  AppLocalization(this._locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _localizedValues;

  // This function will load requested language `.json` file and will assign it to the `_localizedValues` map
  Future loadLanguage() async {
    String jsonStringValues = await rootBundle.loadString(
        "assets/lang/${_locale.languageCode}.json");

    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues =
        mappedValues.map((key, value) => MapEntry(key, value.toString())); // converting `dynamic` value to `String`, because `_localizedValues` is of type Map<String,String>
  }

  String? getTranslatedValue(String key) {
    return _localizedValues[key];
  }
}


