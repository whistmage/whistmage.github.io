import 'package:flutter/material.dart';
import 'package:sandbox/configuration/di.config.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/ui/widgets/app/app.dart';

void main() {
  getIt.init();
  runApp(const App());
}
