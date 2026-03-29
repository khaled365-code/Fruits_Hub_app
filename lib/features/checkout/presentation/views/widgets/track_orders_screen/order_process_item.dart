

import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_tracking_details_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/track_orders_screen/order_state_icon.dart';



class OrderProcessItem extends StatelessWidget {
  const OrderProcessItem({super.key,required this.orderTrackingDetailsEntity});


  final OrderTrackingDetailsEntity orderTrackingDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: OrderStateIcon(orderStateIcon: orderTrackingDetailsEntity.orderImage,),
      title:  Text(orderTrackingDetailsEntity.orderCurrentState,style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.textColors[ThemeCubit().currentTheme]
      ),),
      subtitle:  Text(orderTrackingDetailsEntity.orderValue,style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.c949D9E
      ),),
    );
  }
}
