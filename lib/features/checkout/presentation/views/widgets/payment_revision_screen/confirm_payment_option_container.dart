




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_options_screen/payment_type_container.dart';

class ConfirmPaymentOptionContainer extends StatelessWidget {
  const ConfirmPaymentOptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 9.w),
      decoration: ShapeDecoration(
          color: AppColors.cF2F3F3.withValues(alpha: .5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
      )),
      child: Column(
        children:
        [
          Row(
            children:
            [
              Text('وسيلة الدفع',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold
              ),),
              const Spacer(),
              SvgPicture.asset(ImageConstants.editIcon),
              const SpaceWidget(width: 4,),
              Text('تعديل',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.c949D9E,
              ),),
            ],
          ),
          const SpaceWidget(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

               Text('**** **** **** 6522',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                 color: AppColors.c4E5556
               ),
                 textDirection: TextDirection.ltr,
               ),
              const SpaceWidget(width: 29,),
              PaymentTypeContainer(
                lastColor: AppColors.c1434CB,
                paymentImage: ImageConstants.visaIcon,
              )

                
            ],
          )

        ],
      ),
    );
  }
}
