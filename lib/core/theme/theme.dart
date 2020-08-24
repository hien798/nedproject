import 'package:flutter/material.dart';
import 'color_palette.dart';

enum AppTheme {
  Light
}

final AppThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorPalette.primaryColor,
    accentColor: ColorPalette.secondaryColor,
    backgroundColor: ColorPalette.lightColor,
    fontFamily: 'WorkSans'
  ),
};