import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  static LanguageCubit get to => Modular.get<LanguageCubit>();

  LanguageCubit() : super(const Locale('uz', 'UZ'));

  Future setLocale(Locale locale) async {
    emit(locale);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return (json['app_locale'] as String).toLocale();
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'app_locale': "${state.languageCode}_${state.countryCode}"};
  }
}
