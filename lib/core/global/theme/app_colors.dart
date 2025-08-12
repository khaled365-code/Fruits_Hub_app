

import 'package:flutter/material.dart';

class AppColors {


  // ====== Color Palette ======
  static const gray50 = Color(0xFFF2F3F3);
  static const gray100 = Color(0xFFE4E6E7);
  static const gray200 = Color(0xFFCACCCE);
  static const gray300 = Color(0xFFA5B5B6);
  static const gray400 = Color(0xFF949D9E);
  static const gray500 = Color(0xFF4E5556);
  static const gray600 = Color(0xFF616468);
  static const gray700 = Color(0xFF494F50);
  static const gray800 = Color(0xFF313535);
  static const gray900 = Color(0xFF181A1B);

  static const green50 = Color(0xFFEEFBEA);
  static const green100 = Color(0xFFDDF7D4);
  static const green200 = Color(0xFFBEEFA9);
  static const green300 = Color(0xFF98E77E);
  static const green400 = Color(0xFF76DF53);
  static const green500 = Color(0xFF6CDC46);
  static const green600 = Color(0xFF43AC20);
  static const green700 = Color(0xFF328118);
  static const green800 = Color(0xFF225610);
  static const green900 = Color(0xFF112B08);

  static const orange50 = Color(0xFFFFE6E7);
  static const orange100 = Color(0xFFFDECCE);
  static const orange200 = Color(0xFFFAE9AE);
  static const orange300 = Color(0xFFF8C76D);
  static const orange400 = Color(0xFFF5B33D);
  static const orange500 = Color(0xFFF4A91F);
  static const orange600 = Color(0xFFC2820A);
  static const orange700 = Color(0xFF925107);
  static const orange800 = Color(0xFF614105);
  static const orange900 = Color(0xFF312002);

  static const green1_50 = Color(0xFFEBF9F1);
  static const green1_100 = Color(0xFFD7F4E3);
  static const green1_200 = Color(0xFFBDE8C7);
  static const green1_300 = Color(0xFFA8DDAB);
  static const green1_400 = Color(0xFF60C290);
  static const green1_500 = Color(0xFF1BE537);
  static const green1_600 = Color(0xFF2DF59D);
  static const green1_700 = Color(0xFF227745);
  static const green1_800 = Color(0xFF174F2E);
  static const green1_900 = Color(0xFF082817);

  // ====== Light & Dark ColorSchemes ======
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: green500,
    onPrimary: Colors.white,
    primaryContainer: green100,
    onPrimaryContainer: green900,
    secondary: orange500,
    onSecondary: Colors.white,
    secondaryContainer: orange100,
    onSecondaryContainer: orange900,
    tertiary: green1_500,
    onTertiary: Colors.white,
    tertiaryContainer: green1_100,
    onTertiaryContainer: green1_900,
    error: Colors.red,
    onError: Colors.white,
    errorContainer: Colors.redAccent.shade100,
    onErrorContainer: Colors.red.shade900,
    surface: Colors.white,
    onSurface: gray900,
    surfaceContainerHighest: gray100,
    onSurfaceVariant: gray700,
    outline: gray400,
    shadow: Colors.black,
    inverseSurface: gray900,
    onInverseSurface: Colors.white,
    inversePrimary: green200,
  );

  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: green500,
    onPrimary: Colors.black,
    primaryContainer: green700,
    onPrimaryContainer: green50,
    secondary: orange500,
    onSecondary: Colors.black,
    secondaryContainer: orange700,
    onSecondaryContainer: orange50,
    tertiary: green1_500,
    onTertiary: Colors.black,
    tertiaryContainer: green1_700,
    onTertiaryContainer: green1_50,
    error: Colors.red.shade300,
    onError: Colors.black,
    errorContainer: Colors.red.shade900,
    onErrorContainer: Colors.white,
    surface: gray900,
    onSurface: Colors.white,
    surfaceContainerHighest: gray700,
    onSurfaceVariant: gray100,
    outline: gray500,
    shadow: Colors.black,
    inverseSurface: Colors.white,
    onInverseSurface: gray900,
    inversePrimary: green200,
  );

}
