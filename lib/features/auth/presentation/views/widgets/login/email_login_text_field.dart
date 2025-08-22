


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/view_models/login_bloc/login_bloc.dart';

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
