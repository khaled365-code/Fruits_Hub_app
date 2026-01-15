



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpContainersRow extends StatefulWidget {
  const OtpContainersRow({super.key});

  @override
  State<OtpContainersRow> createState() => _OtpContainersRowState();
}

class _OtpContainersRowState extends State<OtpContainersRow> {


  final defaultPinTheme = PinTheme(
    width: 74.w,
    height: 60.h,
    textStyle:  TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: AppColors.c0C0D0D
    ),
    decoration: BoxDecoration(
      color: AppColors.cf9fafa,
      borderRadius: BorderRadius.circular(4.r),
      border: Border.all(
          width: 1.w,
          color: AppColors.cE6E9EA),
    ),
  );


  final focusedPinTheme= PinTheme(
    width: 74.w,
    height: 60.h,
    textStyle:  TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor
    ),
    decoration: BoxDecoration(
      color: AppColors.cf9fafa,
      borderRadius: BorderRadius.circular(4.r),
      border: Border.all(
          width: 1.w,
          color: AppColors.secondaryColor),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Pinput(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    focusedPinTheme: focusedPinTheme,
    defaultPinTheme: defaultPinTheme,
    onCompleted: (pin) => print(pin),
    );
  }
}

