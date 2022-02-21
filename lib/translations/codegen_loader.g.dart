// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Home": "Quraan with islam sobhi",
  "SOURA_NAZAAT_JOSA": "Soura Elnazeaat josa"
};
static const Map<String,dynamic> ar = {
  "Home": "قرآن بصوت اسلام صبحي",
  "SOURA_NAZAAT_JOSA": "سورة النازعات جزء"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
