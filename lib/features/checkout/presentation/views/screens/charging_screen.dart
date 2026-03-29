


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/checkout_progress_bar.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/charging_screen/payment_options_section.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';
import 'package:uuid/uuid.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({super.key});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {

  bool payWithCash=false;
  @override
  Widget build(BuildContext context) {
    var cartEntityList = ModalRoute.of(context)!.settings.arguments as CartsEntity;
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers:
          [
            CommonAppBar(title: 'الشحن',hasNotification: false,activatePadding: false,),
            SliverToBoxAdapter(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:
                 [
                    const SpaceWidget(height: 16,),
                    CheckoutProgressBar(
                     currentScreenIndex: 0,
                   ),
                   const SpaceWidget(height: 48,),
                   PaymentOptionsSection(payWithCash: (value)
                   {
                     payWithCash=value;
                   },),
                   const SpaceWidget(height: 100,),
                   SharedButton(
                       btnText: 'التالي',
                       onPressedBtn: ()
                       {
                         OrderEntity orderEntity=
                         OrderEntity(carts: cartEntityList, shippingAddress: ShippingAddressEntity(), payWithCash: payWithCash,
                         orderId: Uuid().v4()
                         );

                         navigate(route: Routes.addressScreen, context: context,
                         args: OrderEntity(carts: cartEntityList, shippingAddress: ShippingAddressEntity(), payWithCash: payWithCash,
                         orderId: Uuid().v4()
                         )
                         );
                       })

                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
