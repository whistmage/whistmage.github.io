import 'package:flutter/material.dart';

class LinkButtonStyleExtension
    extends ThemeExtension<LinkButtonStyleExtension> {
  LinkButtonStyleExtension({
    required this.textStyle,
    required this.color,
    this.padding = const EdgeInsets.all(10),
  }) : buttonStyle = TextButton.styleFrom(
          textStyle: textStyle,
          foregroundColor: color,
          padding: padding,
          backgroundColor: Colors.transparent,
        );

  @protected
  final TextStyle textStyle;
  @protected
  final Color color;
  final ButtonStyle buttonStyle;
  final EdgeInsets padding;

  @override
  ThemeExtension<LinkButtonStyleExtension> copyWith({
    TextStyle? textStyle,
    Color? color,
  }) {
    return LinkButtonStyleExtension(
      textStyle: textStyle ?? this.textStyle,
      color: color ?? this.color,
    );
  }

  @override
  ThemeExtension<LinkButtonStyleExtension> lerp(
    covariant ThemeExtension<LinkButtonStyleExtension>? other,
    double offset,
  ) {
    if (other is! LinkButtonStyleExtension) {
      return this;
    }
    return LinkButtonStyleExtension(
      textStyle: textStyle,
      color: Color.lerp(color, other.color, offset) ?? other.color,
    );
  }
}
