import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppThemeModeState extends Cubit<ThemeMode> {
  AppThemeModeState({@factoryParam required Brightness systemSelectedBrightnes})
      : _systemSelectedBrightnes = systemSelectedBrightnes,
        super(ThemeMode.system);

  final Brightness _systemSelectedBrightnes;

  void checkoutMode() {
    switch (state) {
      case ThemeMode.system:
        if (_systemSelectedBrightnes == Brightness.dark) {
          emit(ThemeMode.light);
        } else {
          emit(ThemeMode.dark);
        }
        break;
      case ThemeMode.light:
        emit(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        emit(ThemeMode.light);
        break;
    }
  }
}
