


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class NewPasswordTextFormField extends StatelessWidget {
  const NewPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      contentPadding: EdgeInsetsDirectional.only(start: 16.w,bottom: 24.h,top: 24.h),
      obSecureText: true,
        suffix: Padding(
            padding: EdgeInsetsDirectional.only(end: 31.w),
          child: SvgPicture.asset(ImageConstants.passwordEyeIcon),
        ),
        hintText: 'أدخل كلمه المرور الجديدة',
        controller: TextEditingController(),
        keyBoardType: TextInputType.visiblePassword);
  }
}
