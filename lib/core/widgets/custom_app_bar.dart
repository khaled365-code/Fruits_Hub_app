

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';

AppBar buildCommonAppBar()
{
  return AppBar(
   toolbarHeight: 36.h,
   leading: SizedBox.shrink(),
  );

}