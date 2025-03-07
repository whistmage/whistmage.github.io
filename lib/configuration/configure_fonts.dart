import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandbox/assets/assets.gen.dart';

void configureFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;
  const licenseSection = 'fonts';
  LicenseEntryWithLineBreaks([licenseSection], Assets.fonts.kablammo.ofl);
  LicenseEntryWithLineBreaks([licenseSection], Assets.fonts.gabriela.ofl);
}
