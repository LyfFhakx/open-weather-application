import 'package:flutter/material.dart';

import '../theme_extension/font_extension.dart';
import 'app_colors.dart';
import 'font_theme.dart';

/// theme
final ThemeData appTheme = ThemeData(

    cardColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.black, size: 25),
    colorScheme:
    ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.transparent,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        labelStyle: FontTheme.b2.style(color: AppColors.greyText),
        hintStyle: FontTheme.b1.style(color: AppColors.greyText),
        suffixStyle: FontTheme.b1.style(color: AppColors.blackText),

        suffixIconColor: AppColors.black,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.stroke, width: 1)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1)),
        errorMaxLines: 2),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith((_) => Colors.black),
      fillColor: MaterialStateProperty.resolveWith((_) => Colors.transparent),
      side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(
        color: AppColors.black,
        width: 1,
      )),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)))),
        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 48)),
        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12,horizontal: 32)),
        textStyle: MaterialStatePropertyAll(
            FontTheme.b1Medium.style(color: AppColors.white)),
        backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
      ),
    ),
    extensions: [
      FontExtension(
        b2SF: FontTheme.b2SF.style(),
        b1: FontTheme.b1.style(),
        b1Medium: FontTheme.b1Medium.style(),
        b2: FontTheme.b2.style(),
        b2Medium: FontTheme.b2Medium.style(),
        uMedium: FontTheme.uMedium.style(),
        hBold: FontTheme.hBold.style(),
        bI: FontTheme.bI.style(),
        h1: FontTheme.h1.style(),
      )
    ]);
