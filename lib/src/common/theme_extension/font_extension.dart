import 'package:flutter/material.dart';

class FontExtension extends ThemeExtension<FontExtension> {
  const FontExtension({
    required this.b2SF,
    required this.b1,
    required this.b1Medium,
    required this.b2,
    required this.b2Medium,
    required this.uMedium,
    required this.hBold,
    required this.bI,
    required this.h1,
  });

  final TextStyle b2SF;
  final TextStyle b1;
  final TextStyle b1Medium;
  final TextStyle b2;
  final TextStyle b2Medium;
  final TextStyle uMedium;
  final TextStyle hBold;
  final TextStyle bI;
  final TextStyle h1;

  @override
  ThemeExtension<FontExtension> lerp(
      covariant ThemeExtension<FontExtension>? other, double t) {
    if (other is! FontExtension) {
      return this;
    }
    return FontExtension(
      b2SF: TextStyle.lerp(b2SF, other.b2SF, t) ?? b2SF,
      b1: TextStyle.lerp(b1, other.b1, t) ?? b1,
      b1Medium: TextStyle.lerp(b1Medium, other.b1Medium, t) ?? b1Medium,
      b2: TextStyle.lerp(b2, other.b2, t) ?? b2,
      b2Medium: TextStyle.lerp(b2Medium, other.b2Medium, t) ?? b2Medium,
      uMedium: TextStyle.lerp(uMedium, other.uMedium, t) ?? uMedium,
      hBold: TextStyle.lerp(hBold, other.hBold, t) ?? hBold,
      bI: TextStyle.lerp(bI, other.bI, t) ?? bI,
      h1: TextStyle.lerp(h1, other.h1, t) ?? h1,
    );
  }

  @override
  FontExtension copyWith({
    TextStyle? b2SF,
    TextStyle? b1,
    TextStyle? b1Medium,
    TextStyle? b2,
    TextStyle? b2Medium,
    TextStyle? uMedium,
    TextStyle? hBold,
    TextStyle? bI,
    TextStyle? h1,
  }) {
    return FontExtension(
      b2SF: b2SF ?? this.b2SF,
      b1: b1 ?? this.b1,
      b1Medium: b1Medium ?? this.b1Medium,
      b2: b2 ?? this.b2,
      b2Medium: b2Medium ?? this.b2Medium,
      uMedium: uMedium ?? this.uMedium,
      hBold: hBold ?? this.hBold,
      bI: bI ?? this.bI,
      h1: h1 ?? this.h1,
    );
  }
}
