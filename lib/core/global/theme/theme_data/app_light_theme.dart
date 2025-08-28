


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

abstract class AppLightTheme
{



  static ThemeData getAppLightTheme({required int themeValue})
  {

    return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.backgroundColors[themeValue],
    fontFamily: 'Cairo',
    useMaterial3: true,
    elevatedButtonTheme: _getElevatedButtonTheme(),
    inputDecorationTheme: _getInputDecorationTheme(themeValue),
    textTheme: _getTextTheme(themeValue),
    appBarTheme: _buildAppBarTheme(themeValue),
    dialogTheme: _getDialogTheme(themeValue),
    snackBarTheme: _buildSnackBarTheme(),
    progressIndicatorTheme: _getProgressIndicatorThemeData()

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
      errorBorder: _buildOutlineErrorBorder(themeValue),
      focusedErrorBorder: _buildOutlineErrorBorder(themeValue),
      errorStyle: TextStyle(
        fontSize: 13,
        fontFamily: 'Cairo'
      ),
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
        color: themeValue==1?AppColors.cE6E9EA:AppColors.c1e1e1e
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
      ),
      displayMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal, // regular26
      ),
      displaySmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold, // bold23
         ),

      // Section / Page titles
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal, // regular22
      ),
      headlineMedium: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold, // bold19
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold, // bold16
      ),

      // Subtitles / AppBar text
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // semiBold16
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500, // medium15
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600, // semiBold13
      ),

      // Body text
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal, // regular16
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400, // regular13
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11
      ),

      // Labels / Buttons
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold, // bold13
      ),
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600, // semiBold11
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal, // regular11 (optional duplicate)
      ),
    );


  }

  static AppBarTheme _buildAppBarTheme(int themeValue)
  {
    return AppBarTheme(
      backgroundColor: AppColors.backgroundColors[themeValue],
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundColors[1]
      )
    );

  }

  static _getDialogTheme(int themeValue)
  {

    return DialogThemeData(

      backgroundColor: AppColors.backgroundColors[themeValue],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    );

  }

  static _buildOutlineErrorBorder(int themeValue)
  {

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
            width: 1,
            color: Colors.red
        )
    );
  }

  static _buildSnackBarTheme()
  {

    return SnackBarThemeData(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      )
    );
  }

  static _getProgressIndicatorThemeData()
  {
    return ProgressIndicatorThemeData(
     color: AppColors.primaryColor,
    );


  }













}