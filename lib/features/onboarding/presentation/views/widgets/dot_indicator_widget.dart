


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key,this.notActive=false});

  final bool? notActive;
  @override
  Widget build(BuildContext context) {
    return notActive==true?
    Container(
      width: 9.w,
      height: 9.h,
      decoration: ShapeDecoration(
          shape: OvalBorder(),
          color:  AppColors.c5DB957
      ),
    ):
    Container(
      width: 11.w,
      height: 11.h,
      decoration: ShapeDecoration(
          shape: OvalBorder(),
        color: AppColors.primaryColor
      ),
    );
  }
}
