


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class EmailLoginTextField extends StatelessWidget {
  const EmailLoginTextField({
    super.key, required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      hintText: 'البريد الإلكتروني',
      contentPadding: EdgeInsetsDirectional.only(start: 20.w,top: 15.h,bottom: 17.h),
      controller: emailController,
      keyBoardType: TextInputType.emailAddress,
    );
  }
}
