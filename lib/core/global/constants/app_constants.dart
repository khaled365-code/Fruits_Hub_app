
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

abstract class AppConstants
{

  static const String onBoardIsOpened='onBoardIsOpened';
  static TextStyle inputDataTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
      color: AppColors.textColors[ThemeCubit().currentTheme]
  );
  static const String appLanguage='appLanguage';
  static const String userIsLoggedInAccount='userIsLoggedInAccount';
  static const String currentAppTheme='currentAppTheme';
  static const String userData='userData';
  static const int shippingPrice=30;
  static const String appCurrentCurrency='USD';
  static const String temporaryPostalCode='21505';
  static const String temporaryCountryCode='EG';


}



