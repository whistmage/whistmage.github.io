import 'package:flutter/material.dart';

class AdditionalColors extends ThemeExtension<AdditionalColors> {
  const AdditionalColors({
    required this.overlayColor,
    required this.minorTextColor,
    required this.minorHeaderColor,
  });

  final Color overlayColor;
  final Color minorTextColor;
  final Color minorHeaderColor;

  @override
  ThemeExtension<AdditionalColors> copyWith({
    Color? overlayColor,
    Color? minorTextColor,
    Color? minorHeaderColor,
  }) {
    return AdditionalColors(
      overlayColor: overlayColor ?? this.overlayColor,
      minorTextColor: minorTextColor ?? this.minorTextColor,
      minorHeaderColor: minorHeaderColor ?? this.minorHeaderColor,
    );
  }

  @override
  ThemeExtension<AdditionalColors> lerp(
    covariant ThemeExtension<AdditionalColors>? other,
    double offset,
  ) {
    if (other is! AdditionalColors) {
      return this;
    }
    return AdditionalColors(
      overlayColor: Color.lerp(
            overlayColor,
            other.overlayColor,
            offset,
          ) ??
          overlayColor,
      minorTextColor: Color.lerp(
            minorTextColor,
            other.minorTextColor,
            offset,
          ) ??
          minorTextColor,
      minorHeaderColor: Color.lerp(
            minorHeaderColor,
            other.minorHeaderColor,
            offset,
          ) ??
          minorHeaderColor,
    );
  }
}
