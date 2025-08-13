


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

class AppLightTheme
{



  static ThemeData getAppLightTheme({required int themeValue})
  {

    return ThemeData(
    useMaterial3: true,
    elevatedButtonTheme: _getElevatedButtonTheme(),
    inputDecorationTheme: _getInputDecorationTheme(themeValue),
    textTheme: _getTextTheme(themeValue)

    );



  }

  static _getElevatedButtonTheme()
  {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      )
    );
    
  }

  static _getInputDecorationTheme(int themeValue)
  {

    return InputDecorationTheme(
      enabledBorder: _buildOutlineInputBorder(themeValue),
      focusedBorder: _buildOutlineInputBorder(themeValue),
      errorBorder: _buildOutlineInputBorder(themeValue),
      filled: true,
      fillColor: AppColors.inputDecorationColors[themeValue],
      hintStyle: _getTextTheme(themeValue).labelLarge.copyWith(
        color: AppColors.c949D9E
      )
    );

  }

  static _buildOutlineInputBorder(int themeValue)
  {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: themeValue==1?AppColors.cE6E9EA:Colors.transparent
      )
    );

  }

  static _getTextTheme(int themeValue)
  {

    return  TextTheme(
    // Large / Hero text
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold, // bold28
        fontFamily: 'Cairo',
      ),
      displayMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal, // regular26
        fontFamily: 'Cairo',

      ),
      displaySmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold, // bold23
        fontFamily: 'Cairo',


      ),

      // Section / Page titles
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal, // regular22
          fontFamily: 'Cairo',


      ),
      headlineMedium: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold, // bold19
          fontFamily: 'Cairo',


      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold, // bold16
          fontFamily: 'Cairo',


      ),

      // Subtitles / AppBar text
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // semiBold16
          fontFamily: 'Cairo',



      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500, // medium15
          fontFamily: 'Cairo',

      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600, // semiBold13
          fontFamily: 'Cairo',

      ),

      // Body text
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal, // regular16
          fontFamily: 'Cairo',

      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal, // regular13
          fontFamily: 'Cairo',

      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11
          fontFamily: 'Cairo',

      ),

      // Labels / Buttons
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold, // bold13
          fontFamily: 'Cairo',

      ),
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600, // semiBold11
          fontFamily: 'Cairo',
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11 (optional duplicate)
          fontFamily: 'Cairo',
      ),
    );


  }













}