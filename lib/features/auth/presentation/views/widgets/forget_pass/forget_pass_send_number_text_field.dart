


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class ForgetPassSendNumberTextField extends StatelessWidget {
  const ForgetPassSendNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        textAlign: TextAlign.end,
        hintText: 'رقم الهاتف',
        contentPadding: EdgeInsetsDirectional.only(end: 16.w,top: 17.h,bottom: 17.h),
        controller: TextEditingController(),
        keyBoardType: TextInputType.number);
  }
}
