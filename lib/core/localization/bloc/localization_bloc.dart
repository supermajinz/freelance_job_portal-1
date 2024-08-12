import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart' as timeago_ar show ArMessages;

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initial()) {
    // ضبط اللغة عند التحميل
    on<LoadSavedLocalization>(getLanguage);
    // تغيير اللغة
    on<LoadLocalization>(changeLanguage);
  }

  void changeLanguage(LoadLocalization event, Emitter<LocalizationState> emit) {
    if (event.locale == state.locale) return;

    // حفظ اللغة الجديدة
    saveLocale(event.locale);
    // تحديث حالة Bloc
    emit(LocalizationState(event.locale));

    // ضبط timeago بناءً على اللغة الجديدة
    _setTimeagoLocale(event.locale.languageCode);
  }

  FutureOr<void> getLanguage(
      LoadSavedLocalization event, Emitter<LocalizationState> emit) async {
    Locale savedLocale = await getLocale();
    emit(LocalizationState(savedLocale));

    // ضبط timeago بناءً على اللغة المحفوظة
    _setTimeagoLocale(savedLocale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    return Locale(languageCode);
  }

  void saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
  }

  void _setTimeagoLocale(String languageCode) {
    // تعيين رسائل timeago بناءً على اللغة
    if (languageCode == 'ar') {
      timeago.setLocaleMessages('ar', timeago_ar.ArMessages());
    } else {
      // يمكنك إضافة لغات أخرى إذا لزم الأمر
      timeago.setLocaleMessages('en', timeago.EnMessages());
    }
  }
}
