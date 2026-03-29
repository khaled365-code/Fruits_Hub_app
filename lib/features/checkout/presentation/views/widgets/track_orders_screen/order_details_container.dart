

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/track_orders_screen/order_state_icon.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 19.h,bottom: 19.h,start: 5.w),
      color: AppColors.cF2F3F3.withValues(alpha: .5),
      child: Row(
        children:
        [
          OrderStateIcon(orderStateIcon: ImageConstants.cubicIcon,),
          const SpaceWidget(width: 16,),
          Column(
            children:
            [
              Text('طلب رقم: 1234567#',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textColors[ThemeCubit().currentTheme]
              ),),
              const SpaceWidget(height: 6,),
              Text('تم الطلب :22 مارس ,2024',style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 11 ,
                  color: AppColors.c949D9E
              ),),
              const SpaceWidget(height: 6,),
              Row(
                children:
                [
                   Text.rich(
                     TextSpan(
                     children: [
                       TextSpan(text: 'عدد الطلبات :',style: Theme.of(context).textTheme.labelSmall?.copyWith(
                           fontSize: 10,
                           color: AppColors.c949D9E
                       )),
                       TextSpan(text: '10',style: Theme.of(context).textTheme.labelSmall?.copyWith(
                           fontSize: 10,
                           color: AppColors.textColors[ThemeCubit().currentTheme]
                       ))
                     ]
                   )),
                  const SpaceWidget(width: 15,),
                  Text('250 جنية',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColors[ThemeCubit().currentTheme]
                  ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
