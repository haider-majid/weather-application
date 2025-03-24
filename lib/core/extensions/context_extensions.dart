import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

extension LanguageExtension on BuildContext {
  void toggleLanguage() {
    final newLocale =
        locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    setLocale(newLocale);
  }
}
