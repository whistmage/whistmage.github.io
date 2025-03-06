import 'dart:ui';
import 'package:window_manager/window_manager.dart';
import 'dart:io' as io;
import 'package:sandbox/configuration/platform_specific_adapter/platform.dart';

Platform getPlatform() {
  if (io.Platform.isAndroid || io.Platform.isIOS) return Platform.mobile;
  return Platform.desktop;
}

Future<void> setupPlatformSpecificConfiguration() async {
  if (io.Platform.isAndroid || io.Platform.isIOS) return;
  await windowManager.ensureInitialized();
  await windowManager.setMinimumSize(const Size(400, 400));
}
