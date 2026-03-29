


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/checkout_progress_bar.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_options_screen/make_card_default_row.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_options_screen/payment_options_row.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderEntity orderEntity=ModalRoute.of(context)!.settings.arguments as OrderEntity;
    print('PayWithCash value:${orderEntity.payWithCash}');
    return Scaffold(
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
                   padding:  EdgeInsets.symmetric(horizontal: 14.5.w),
                   child: CheckoutProgressBar(currentScreenIndex: 2,),
                 ),
                 const SpaceWidget(height: 24,),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:
                     [
                        Text('أختار طريقه الدفع المناسبه :',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.textColors[ThemeCubit().currentTheme]
                        ),),
                       const SpaceWidget(height: 13,),
                       Text('من فضلك اختر طريقه الدفع المناسبه لك.',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                           color: AppColors.c616A6B
                       ),),
                       const SpaceWidget(height: 13,),
                       PaymentOptionsRow(),
                       const SpaceWidget(height: 16,),
                       CustomOutlinedTextField(
                           hintText: 'اسم حامل البطاقه',
                           controller: TextEditingController(),
                           keyBoardType: TextInputType.name),
                       const SpaceWidget(height: 8,),
                       CustomOutlinedTextField(
                           textFormatterList: [
                             FilteringTextInputFormatter.digitsOnly
                           ],
                           hintText: 'رقم البطاقة',
                           controller: TextEditingController(),
                           keyBoardType: TextInputType.number),
                       const SpaceWidget(height: 7,),
                       Row(
                         children: [
                           Expanded(child: CustomOutlinedTextField(
                               hintText: 'تاريخ الصلاحيه',
                               controller: TextEditingController(),
                               keyBoardType: TextInputType.datetime)),
                           const SpaceWidget(width: 16,),
                           Expanded(child: CustomOutlinedTextField(
                               textFormatterList:
                               [
                                 FilteringTextInputFormatter.digitsOnly
                               ],
                               hintText: 'CVV',
                               controller: TextEditingController(),
                               keyBoardType: TextInputType.number)),

                         ],
                       ),
                       const SpaceWidget(height: 16,),
                       MakeCardDefaultRow(),
                       const SpaceWidget(height: 60,),
                       SharedButton(
                           btnText: 'تأكيد & استمرار',
                           onPressedBtn: ()
                           {
                              // navigate(route: Routes.paymentRevisionScreen, context: context,args: orderEntity);
                           })





                     ],
                   ),
                 )


               ],
             ),
           )

          
          
        ],
      ),
    );
  }
}
