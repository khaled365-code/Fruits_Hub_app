


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/enums.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/manager/place_order_bloc.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/checkout_progress_bar.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_revision_screen/edit_address_container.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_revision_screen/pricing_details_container.dart';

import '../widgets/payment_revision_screen/confirm_payment_option_container.dart';

class PaymentRevisionScreen extends StatelessWidget {
  const PaymentRevisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderEntity orderEntity=ModalRoute.of(context)!.settings.arguments as OrderEntity;
    return BlocListener<PlaceOrderBloc, PlaceOrderState>(
    listener: (context, state) {
     if(state.placeOrderRequestState==RequestStates.error)
       {
         buildSnackBarMessage(text: state.PlaceOrderErrorM, context: context);
       }
     if (state.placeOrderRequestState==RequestStates.success)
       {
         buildSnackBarMessage(text: state.PlaceOrderSuccessM, context: context);
         navigate(route: Routes.successPaymentScreen, context: context);
       }
    },
  child: Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers: 
        [
           CommonAppBar(title: 'الدفع',hasNotification: false,),
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 const SpaceWidget(height: 16,),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 13.w),
                   child: CheckoutProgressBar(
                      payWithCash: orderEntity.payWithCash,
                     currentScreenIndex: 3,),
                 ),
                 const SpaceWidget(height: 24,),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:
                     [
                       Text('ملخص الطلب :',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                           color: AppColors.textColors[ThemeCubit().currentTheme],
                           fontWeight: FontWeight.bold
                       ),),
                       const SpaceWidget(height: 8,),
                       PricingDetailsContainer(
                         orderEntity: orderEntity,
                       ),
                       const SpaceWidget(height: 16,),
                       Text('يرجي تأكيد  طلبك',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                           color: AppColors.textColors[ThemeCubit().currentTheme],
                           fontWeight: FontWeight.bold
                       ),),
                       const SpaceWidget(height: 8,),
                       Visibility(
                         visible: orderEntity.payWithCash==false,
                         child: Column(
                           children:
                           [
                             ConfirmPaymentOptionContainer(),
                             const SpaceWidget(height: 8,),
                           ],
                         ),
                       ),
                       EditAddressContainer(
                         orderEntity: orderEntity,
                         shippingAddressEntity: orderEntity.shippingAddress,
                       ),
                       const SpaceWidget(height: 51,),
                       BlocBuilder<PlaceOrderBloc, PlaceOrderState>(
                       builder: (context, state) {
                       if(state.placeOrderRequestState==RequestStates.loading)
                         {
                           return Center(child: CircularProgressIndicator());
                         }
                       else
                         {
                           return SharedButton(btnText: 'تأكيد الطلب',
                               onPressedBtn: () 
                               {
                                  context.read<PlaceOrderBloc>().add(AddOrderEvent(orderEntity: orderEntity));
                               });
                         }
  },
)


                     ],
                   ),
                 )


               ],
             ),
           )


        ],
      ),
    ),
);
  }
}




