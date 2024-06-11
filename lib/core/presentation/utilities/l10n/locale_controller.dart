
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller that stores and maintain data about localization
class LocaleController with ChangeNotifier {
  /// Constructor that loads [Locale] and notifies listeners
  LocaleController() {
    _locale = const Locale.fromSubtags(countryCode: 'us');
    notifyListeners();
  }

  late Locale _locale;

  /// Current [Locale] in project
  Locale get locale => _locale;

  /// Changes current [Locale] to 'en' or 'ru'
  Future<void> changeLocale(Locale locale) async {
    Get.updateLocale(locale);
    _locale = locale;
    notifyListeners();
  }
}
