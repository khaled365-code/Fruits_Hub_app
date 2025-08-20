

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class LoginOptionContainer extends StatelessWidget {
  const LoginOptionContainer({super.key, required this.loginIcon, required this.loginOptionText});

  final String loginIcon;
  final String loginOptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 17.5.w,bottom: 17,top: 17),
      height: 56.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: ShapeDecoration(
          color: AppColors.backgroundColors[ThemeCubit().currentTheme],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: AppColors.cDDDFDF,
              width: 1,
            ),
          ),),
      child: Row(
        children:
        [
          SvgPicture.asset(loginIcon),
          SpaceWidget(width: 53.w,),
          Text(loginOptionText,style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.c0C0D0D
          ),)
        ],
      ),
    );
  }
}
