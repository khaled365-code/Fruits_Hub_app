


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class ConfirmNewPasswordTextField extends StatefulWidget {
  const ConfirmNewPasswordTextField({super.key});

  @override
  State<ConfirmNewPasswordTextField> createState() => _ConfirmNewPasswordTextFieldState();
}

class _ConfirmNewPasswordTextFieldState extends State<ConfirmNewPasswordTextField> {

  bool securedText=false;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        contentPadding: EdgeInsetsDirectional.only(start: 16.w,bottom: 16.h,top: 16.h),
        obSecureText: securedText,
        suffix: GestureDetector(
          onTap:()
            {
              setState(() {
                securedText=!securedText;
              });
              },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 31.w),
            child: securedText? SvgPicture.asset(ImageConstants.securedEyePasswordIcon,colorFilter: ColorFilter.mode(AppColors.cC9CECF, BlendMode.srcIn),) : SvgPicture.asset(ImageConstants.eyeVisibleIcon,colorFilter: ColorFilter.mode(AppColors.cC9CECF, BlendMode.srcIn),),
          ),
        ),
        hintText: 'أعد إدخال كلمة المرور',
        controller: TextEditingController(),
        keyBoardType: TextInputType.visiblePassword);;
  }
}
