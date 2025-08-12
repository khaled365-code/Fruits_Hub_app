


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

class AppLightTheme
{



  static ThemeData getAppLightTheme()
  {

    return ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.lightColorScheme,
    elevatedButtonTheme: _getElevatedButtonTheme(),
    inputDecorationTheme: _getInputDecorationTheme(),
    textTheme: _getTextTheme(scheme: AppColors.lightColorScheme)

    );



  }

  static _getElevatedButtonTheme() 
  {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 54),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      )
    );
    
  }

  static _getInputDecorationTheme()
  {

    return InputDecorationTheme(
      enabledBorder: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(),
      filled: true,
    );

  }

  static _buildOutlineInputBorder()
  {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1
      )
    );

  }

  static _getTextTheme({required ColorScheme scheme})
  {

    return  TextTheme(
    // Large / Hero text
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold, // bold28
        fontFamily: 'Cairo',
        color: scheme.onSurface
      ),
      displayMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal, // regular26
        fontFamily: 'Cairo', color: scheme.onSurface

      ),
      displaySmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold, // bold23
        fontFamily: 'Cairo', color: scheme.onSurface


      ),

      // Section / Page titles
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal, // regular22
          fontFamily: 'Cairo',
          color: scheme.onSurface

      ),
      headlineMedium: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold, // bold19
          fontFamily: 'Cairo',
          color: scheme.onSurface

      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold, // bold16
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),

      // Subtitles / AppBar text
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // semiBold16
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500, // medium15
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600, // semiBold13
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),

      // Body text
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal, // regular16
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal, // regular13
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11
          fontFamily: 'Cairo',
          color: scheme.onSurface


      ),

      // Labels / Buttons
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold, // bold13
          fontFamily: 'Cairo',color: scheme.onPrimary


      ),
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600, // semiBold11
          fontFamily: 'Cairo',color: scheme.onPrimary

      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11 (optional duplicate)
          fontFamily: 'Cairo',color: scheme.onPrimary
      ),
    );


  }













}