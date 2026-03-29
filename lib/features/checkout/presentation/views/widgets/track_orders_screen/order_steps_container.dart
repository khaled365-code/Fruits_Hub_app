


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_tracking_details_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/track_orders_screen/order_process_item.dart';

class OrderStepsContainer extends StatelessWidget {
  const OrderStepsContainer({super.key});


  static const List<OrderTrackingDetailsEntity> orderDetailsList=
  [
    OrderTrackingDetailsEntity(orderImage: ImageConstants.boxIcon, orderCurrentState: 'تتبع الطلب', orderValue: '22 مارس , 2024'),
    OrderTrackingDetailsEntity(orderImage: ImageConstants.acceptOrderIcon, orderCurrentState: 'قبول الطلب', orderValue: '22 مارس , 2024'),
    OrderTrackingDetailsEntity(orderImage: ImageConstants.orderInCharge, orderCurrentState: 'تم شحن الطلب', orderValue: '22 مارس , 2024'),
    OrderTrackingDetailsEntity(orderImage: ImageConstants.trackIcon, orderCurrentState: 'خرج للتوصيل', orderValue: 'قيد الانتظار'),
    OrderTrackingDetailsEntity(orderImage: ImageConstants.orderDeliveredIcon, orderCurrentState: 'تم تسليم', orderValue: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 20.h,bottom: 20.h,start: 30.w),
      color: AppColors.cF2F3F3.withValues(alpha: .5),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children:
          [
              ListView.separated(
                clipBehavior: Clip.none,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=> OrderProcessItem(orderTrackingDetailsEntity: orderDetailsList[index],),
                  separatorBuilder: (context,index)=> Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 60.w),
                    child: Divider(height: 32, color: Colors.grey, thickness: 1,),
                  ),
                  itemCount: orderDetailsList.length)
          ],
        ),
      ),

    );
  }
}
