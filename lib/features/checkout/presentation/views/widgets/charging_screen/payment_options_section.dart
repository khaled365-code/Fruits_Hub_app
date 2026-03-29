

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/charging_payment_option_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/charging_screen/payment_option_container.dart';

class PaymentOptionsSection extends StatefulWidget {
  const PaymentOptionsSection({super.key,required this.payWithCash});

  static const List<ChargingPaymentOptionEntity> paymentOptionsList=
  [
    ChargingPaymentOptionEntity(paymentType: 'الدفع عند الاستلام', paymentDetails: 'التسليم من المكان', price: '${AppConstants.shippingPrice} جنيه'),
    ChargingPaymentOptionEntity(paymentType: 'اشتري الان وادفع أونلاين', paymentDetails: 'يرجي تحديد طريقه الدفع', price: 'مجاني'),
  ];

  final ValueChanged<bool> payWithCash;

  @override
  State<PaymentOptionsSection> createState() => _PaymentOptionsSectionState();
}

class _PaymentOptionsSectionState extends State<PaymentOptionsSection> {

  List<bool> selectedItems=[false,true];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) => InkWell(
        onTap: ()
        {
          setState(() {
           for (int i=0;i<selectedItems.length;i++)
             {
               selectedItems[i]=false;
             }
           selectedItems[index]=true;
          });
             _returnPayWithCashValue();
        },
        child: Padding(
          padding:  EdgeInsets.only(bottom: 8.0.h),
          child: PaymentOptionContainer(
            itemIsSelected: selectedItems[index],
            paymentOptionData: PaymentOptionsSection.paymentOptionsList[index],
          ),
        ),
      )),
    );
  }

  void _returnPayWithCashValue() {
     if(selectedItems[0]==true)
      {
        widget.payWithCash(true);
      }
    else
      {
        widget.payWithCash(false);
      }
  }
}
