

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class PasswordLoginTextField extends StatelessWidget {
  const PasswordLoginTextField({
    super.key, required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      obSecureText: true,
      hintText: 'كلمة المرور',
      contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h,),
      controller: passwordController,
      keyBoardType: TextInputType.text,
      suffix: Padding(
        padding: EdgeInsetsDirectional.only(end: 31.w),
        child: SvgPicture.asset(ImageConstants.passwordEyeIcon),
      ),
    );
  }
}
