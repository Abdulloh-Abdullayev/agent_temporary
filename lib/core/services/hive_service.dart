import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:agent/core/localization/locale_keys.g.dart';

class HiveService {
  static HiveService get to => Modular.get<HiveService>();

  late Box _box;

  static Future<HiveService> init() async {
    var instance = HiveService();

    instance._box = await Hive.openBox(LocaleKeys.app_name);

    return instance;
  }

  Future delete() async {
    await Hive.deleteFromDisk();
  }

  String getLang() {
    return _box.get(_HiveKeys.lang, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.lang, locale.toString());
  }
}

class _HiveKeys {
  static const String lang = "lang";
}
