import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette._();

  static const int _primaryColorCode = 0xFF1E1D1D;
  static const int _accentColorCode = 0xFF201AE0;

  //blue
  static const int _yellowGreenCode = 0xFFD1EF53;
  static const int _lightColorCode = 0xFFFDFBFE;
  static const int _redColorCode = 0xFFFF5353;
  static const int _darkColorCode = 0xFF383838;
  static const int _greyColorCode = 0xFFF1F1F1;
  static const int _grey2ColorCode = 0xFF979797;
  static const int _violetPinkCode = 0xFF3D4E7A;
  static const int _redGreenCode = 0xFFEFC082;

  static const MaterialColor primaryColor = const MaterialColor(
    _primaryColorCode,
    const <int, Color>{500: const Color(_primaryColorCode)},
  );

  static const MaterialColor yellowGreenColor = const MaterialColor(
    _yellowGreenCode,
    const <int, Color>{500: const Color(_yellowGreenCode)},
  );

  static const MaterialColor greyColor = const MaterialColor(
    _greyColorCode,
    const <int, Color>{500: const Color(_greyColorCode)},
  );

  static const MaterialColor grey2Color = const MaterialColor(
    _grey2ColorCode,
    const <int, Color>{500: const Color(_grey2ColorCode)},
  );

  static const MaterialColor violetPinkColor = const MaterialColor(
    _violetPinkCode,
    const <int, Color>{500: const Color(_violetPinkCode)},
  );

  static const MaterialColor redGreenColor = const MaterialColor(
    _redGreenCode,
    const <int, Color>{500: const Color(_redGreenCode)},
  );

  static const MaterialColor redColor = const MaterialColor(
    _redColorCode,
    const <int, Color>{500: const Color(_redColorCode)},
  );

  static const MaterialColor darkColor = const MaterialColor(
    _darkColorCode,
    const <int, Color>{500: const Color(_darkColorCode)},
  );

  static const MaterialColor lightColor = const MaterialColor(
    _lightColorCode,
    const <int, Color>{500: const Color(_lightColorCode)},
  );

  static const MaterialColor secondaryColor = const MaterialColor(
    _accentColorCode,
    const <int, Color>{500: const Color(_accentColorCode)},
  );
}
