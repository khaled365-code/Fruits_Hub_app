

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/track_orders_screen/order_details_container.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/track_orders_screen/order_steps_container.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 17.w,end: 16.w),
        child: CustomScrollView(
          slivers:
          [
             CommonAppBar(title: 'تتبع الطلب',hasNotification: false,activatePadding: false,),
             SliverToBoxAdapter(
               child: Column(
                 children:
                 [
                   const SpaceWidget(height: 16,),
                   OrderDetailsContainer(),
                   const SpaceWidget(height: 19,),
                 ],
               ),
             ),
             SliverToBoxAdapter(
              child: Column(
                children: [
                  OrderStepsContainer(),
                  SpaceWidget(height: 13,)
                ],
              ),
             ),

          ],
        ),
      ),
    );
  }
}
