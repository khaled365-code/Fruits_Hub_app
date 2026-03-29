


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';

class PricingDetailsContainer extends StatelessWidget {
  const PricingDetailsContainer({super.key,required this.orderEntity});

  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: AppColors.cF2F3F3.withValues(alpha: .5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
      ),
      child: Column(
        children:
        [
           Row(
             children:
             [
               Text('المجموع الفرعي :',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                 color: AppColors.c4E5556
               ),),
               const Spacer(),
               Text('${orderEntity.carts.calculateAllCartsPrice()} جنيه',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                 color: AppColors.textColors[ThemeCubit().currentTheme],
                 fontSize: 16
               ),),
             ],
           ),
          const SpaceWidget(height: 8,),
          Row(
            children:
            [
              Text('التوصيل  :',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.c4E5556
              ),),
              const Spacer(),
              Text('${AppConstants.shippingPrice} جنية',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.c4E5556,
              ),),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32.w),
            child: Divider(
              height: 16,
              color: AppColors.cCACECE,
              thickness: .5,
            ),
          ),
          Row(
            children:
            [
              Text('الكلي',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme],
                  fontSize: 16
              ),),
              const Spacer(),
              Text('${orderEntity.carts.calculateAllCartsPrice() + AppConstants.shippingPrice} جنيه',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme],
                  fontSize: 16
              ),),
            ],
          ),


        ],
      ),
    );
  }
}
