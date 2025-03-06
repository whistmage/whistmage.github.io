import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sandbox/configuration/di.config.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/configuration/platform_specific_adapter/platform_specific_adapter.dart';
import 'package:sandbox/ui/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  getIt.init();
  await setupPlatformSpecificConfiguration();
  runApp(const App());
}
