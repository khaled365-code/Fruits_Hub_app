

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/charging_payment_option_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/charging_screen/select_circle_container.dart';

class PaymentOptionContainer extends StatelessWidget {

   final ChargingPaymentOptionEntity paymentOptionData;
   final bool itemIsSelected;


   const PaymentOptionContainer({super.key,required this.paymentOptionData, required this.itemIsSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 16.h,bottom: 16.h,end: 13.w,start: 9.w),
      decoration: ShapeDecoration(
        color: AppColors.cD9D9D9.withValues(alpha: .2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
          side: itemIsSelected? BorderSide(
            width: 1.w,
            color: AppColors.primaryColor
          ): BorderSide.none
        )
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SelectCircleContainer(isSelected: itemIsSelected),
            const SpaceWidget(width: 10,),
            Column(
              children: [
                Text(paymentOptionData.paymentType,style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme]
                ),),
                const SpaceWidget(height: 6,),
                Text(paymentOptionData.paymentDetails,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.black.withValues(alpha: .5)
                ),),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(paymentOptionData.price ,style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.c3A8B33
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
