
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

abstract class AppConstants
{

  static const String onBoardIsOpened='onBoardIsOpened';
  static TextStyle inputDataTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600, // semiBold16
      fontFamily: 'Cairo',
      color: AppColors.textColors[ThemeCubit().currentTheme]
  );
  static const String appLanguage='appLanguage';


}
