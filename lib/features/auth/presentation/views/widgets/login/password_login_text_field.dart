

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class PasswordLoginTextField extends StatefulWidget {
  const PasswordLoginTextField({
    super.key, required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordLoginTextField> createState() => _PasswordLoginTextFieldState();
}

class _PasswordLoginTextFieldState extends State<PasswordLoginTextField> {

  bool securedText=true;
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
      controller: widget.passwordController,
      keyBoardType: TextInputType.text,
      suffix: Padding(
        padding: EdgeInsetsDirectional.only(end: 31.w),
        child: GestureDetector(
          onTap: ()
            {
              setState(() {
                securedText=!securedText;
              });
            },
            child: securedText==true?SvgPicture.asset(ImageConstants.securedEyePasswordIcon): SvgPicture.asset(ImageConstants.passwordEyeIcon)),
      ),
    );
  }
}
