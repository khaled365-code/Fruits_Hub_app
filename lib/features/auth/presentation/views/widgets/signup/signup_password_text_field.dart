


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class PasswordSignUpTextField extends StatefulWidget {
  const PasswordSignUpTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordSignUpTextField> createState() => _PasswordSignUpTextFieldState();
}

class _PasswordSignUpTextFieldState extends State<PasswordSignUpTextField> {

  bool securedText=false;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      validator: (value)
      {
        if(value!.isEmpty)
          {
            return 'كلمة المرور مطلوبة';
          }
        else
          {
            return null;
          }
      },
      obSecureText: securedText,
      hintText: 'كلمة المرور',
      contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h,),
      controller: widget.controller,
      keyBoardType: TextInputType.visiblePassword,
      suffix: Padding(
        padding: EdgeInsetsDirectional.only(end: 31.w),
        child: GestureDetector(
          onTap: ()
          {
            setState(() {
              securedText=!securedText;
            });
          },
            child: securedText ? SvgPicture.asset(ImageConstants.securedEyePasswordIcon,colorFilter: ColorFilter.mode(AppColors.cC9CECF, BlendMode.srcIn),) : SvgPicture.asset(ImageConstants.eyeVisibleIcon,colorFilter: ColorFilter.mode(AppColors.cC9CECF, BlendMode.srcIn),)),
      ),
    );
  }
}
