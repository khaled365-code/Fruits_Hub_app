


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});



  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  bool isActive=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        setState(() {
          isActive=!isActive;
        });
      },
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: ShapeDecoration(
          color: isActive==true? AppColors.primaryColor: AppColors.backgroundColors[locator<ThemeCubit>().currentTheme],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: isActive==false? BorderSide(
                color: AppColors.cDDDFDF,
                width: 1.5.w
              ): BorderSide.none
            )
        ),
        child: isActive==true? Center(child: SvgPicture.asset(ImageConstants.checkTrueIcon)) : SizedBox.shrink(),
      ),
    );
  }
}
