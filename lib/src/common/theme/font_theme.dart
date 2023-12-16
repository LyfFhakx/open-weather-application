import 'package:flutter/widgets.dart';

import 'app_colors.dart';

enum FontTheme {
  b2SF(15, FontWeight.w400, 22, fontFamily: "SF Pro Text"),
  b1(17.0, FontWeight.w400, 24),
  b1Medium(17.0, FontWeight.w500, 24),
  b2(15.0, FontWeight.w400, 22),
  b2Medium(15.0, FontWeight.w500, 22),
  uMedium(64, FontWeight.w500, 72, fontFamily: "Ubuntu"),
  hBold(48, FontWeight.w700, 58.09, fontFamily: "Inter"),
  bI(24, FontWeight.w300, 29.05, fontFamily: "Inter"),
  h1(28, FontWeight.w500, 32, fontFamily: "Ubuntu");

  const FontTheme(
    double fontSize,
    FontWeight fontWeight,
    double lineHeight, {
    String fontFamily = "Roboto",
  })  : _fontFamily = fontFamily,
        _fontWeight = fontWeight,
        _fontSize = fontSize,
        _lineHeight = lineHeight;

  final double _fontSize;
  final FontWeight _fontWeight;
  final double _lineHeight;
  final String _fontFamily;

  TextStyle style({
    Color? color,
    Color? backgroundColor,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
          color: color ?? AppColors.white,
          backgroundColor: backgroundColor,
          decoration: decoration,
          decorationColor: decorationColor,
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          height: _lineHeight / _fontSize,
          fontFamily: _fontFamily);
}
