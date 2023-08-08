import 'package:flutter/material.dart';

class AppColors {
  // Light and dark ColorSchemes made by FlexColorScheme v7.1.2.
// These ColorScheme objects require Flutter 3.7 or later.

  static const List<Color> noteColors = [
    Color(0xffe59a18),
    Color(0xffb00020),
    Color(0xffb1c0dd),
    Color(0xff60748a),
    Color(0xffcf6679),
    Colors.white,
    Color(0xfffcd8df),
  ];

  static Color textColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff1a2c42),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffb1c0dd),
    onPrimaryContainer: Color(0xff0f1012),
    secondary: Color(0xffe59a18),
    onSecondary: Color(0xff000000),
    secondaryContainer: Color(0xffe0bd80),
    onSecondaryContainer: Color(0xff13100b),
    tertiary: Color(0xfff0b03f),
    onTertiary: Color(0xff000000),
    tertiaryContainer: Color(0xffe9cfa1),
    onTertiaryContainer: Color(0xff13110e),
    error: Color(0xffb00020),
    onError: Color(0xffffffff),
    errorContainer: Color(0xfffcd8df),
    onErrorContainer: Color(0xff141213),
    background: Color(0xfff8f9f9),
    onBackground: Color(0xff090909),
    surface: Color(0xfff8f9f9),
    onSurface: Color(0xff090909),
    surfaceVariant: Color(0xffe2e3e4),
    onSurfaceVariant: Color(0xff111111),
    outline: Color(0xff7c7c7c),
    outlineVariant: Color(0xffc8c8c8),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff111112),
    onInverseSurface: Color(0xfff5f5f5),
    inversePrimary: Color(0xff9eacbd),
    surfaceTint: Color(0xff1a2c42),
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff60748a),
    onPrimary: Color(0xfff6f8f9),
    primaryContainer: Color(0xff1a2c42),
    onPrimaryContainer: Color(0xffe3e6ea),
    secondary: Color(0xffebb251),
    onSecondary: Color(0xff14110a),
    secondaryContainer: Color(0xffd48608),
    onSecondaryContainer: Color(0xfffff4e1),
    tertiary: Color(0xfff4ca7e),
    onTertiary: Color(0xff14130d),
    tertiaryContainer: Color(0xffc68e2d),
    onTertiaryContainer: Color(0xfffef6e6),
    error: Color(0xffcf6679),
    onError: Color(0xff140c0d),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfffbe8ec),
    background: Color(0xff151617),
    onBackground: Color(0xffececec),
    surface: Color(0xff151617),
    onSurface: Color(0xffececec),
    surfaceVariant: Color(0xff36383a),
    onSurfaceVariant: Color(0xffdfdfe0),
    outline: Color(0xff797979),
    outlineVariant: Color(0xff2d2d2d),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xfff6f7f9),
    onInverseSurface: Color(0xff131313),
    inversePrimary: Color(0xff38404a),
    surfaceTint: Color(0xff60748a),
  );
}
