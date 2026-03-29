

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class PaymentTypeContainer extends StatelessWidget {
  const PaymentTypeContainer({super.key,required this.paymentImage, this.lastColor});

  final String paymentImage;
  final Color? lastColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
                offset: Offset(0,20),
                blurRadius: 40,
                color: AppColors.cB7B7B7.withValues(alpha: .08),
                spreadRadius: 0
            )
          ],
          color: lastColor??AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: const BorderSide(
              width: 1,
              color: AppColors.cD6DCE5,
            ),
          )),
      child: Center(child: SvgPicture.asset(paymentImage)),
    );
  }
}
