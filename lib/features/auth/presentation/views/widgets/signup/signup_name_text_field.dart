


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class SignUpNameTextField extends StatelessWidget {
  const SignUpNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        hintText: 'الاسم كامل',
        contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h),
        controller: TextEditingController(),
        keyBoardType: TextInputType.name,
        inputDataStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600, // semiBold16
            fontFamily: 'Cairo',
            color: AppColors.textColors[locator<ThemeCubit>().currentTheme]
        ),
    );
  }
}
