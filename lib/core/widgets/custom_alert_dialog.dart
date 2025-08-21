


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColors[ThemeCubit().currentTheme],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
     titlePadding: EdgeInsetsDirectional.only(top: 25.h,),
     actionsPadding: EdgeInsetsDirectional.only(top: 29.h,bottom: 50.h,start: 90.w,end: 90.w),
      title: SvgPicture.asset(ImageConstants.checkBigTrueIcon),
      actions: [
        Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('تم تغيير الباسورد بنجاح',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.c0C0D0D
            ),),
          ),
        ),
     ],
    );
  }
}
