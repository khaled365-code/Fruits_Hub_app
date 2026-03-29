

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_scret_keys.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_payment_model.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/payment_options_screen/payment_type_container.dart';

class PaymentOptionsRow extends StatelessWidget {
  const PaymentOptionsRow({super.key});

   static const List<String> paymentOptions=[
     ImageConstants.applePayIcon,
     ImageConstants.paypalIcon,
     ImageConstants.masterCardIcon,
     ImageConstants.visaIcon,
   ];

  @override
  Widget build(BuildContext context) {
    OrderEntity orderEntity = ModalRoute.of(context)!.settings.arguments as OrderEntity;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  paymentOptions.asMap().entries.map((item){
          int index=item.key;
          return InkWell(
            onTap: ()
            {
              if(index==3)
                {
                  _handlePaymentProcess(context: context, orderEntity: orderEntity);
                }
              else
                {
                  buildMaterialBannerWidget(text: 'وسيلة الدفع غير مدعومه حاليا', context: context,);
                }
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 16.w),
              child: PaymentTypeContainer(
                paymentImage: paymentOptions[index],
                lastColor: index==3? AppColors.c1434CB : AppColors.transparent,
              ),
            ),
          );
        }).toList()
      ),
    );
  }
  
  void _handlePaymentProcess({required BuildContext context ,required OrderEntity orderEntity })
  {
    PaypalPaymentModel paypalPaymentModel =PaypalPaymentModel.fromOrderEntity(orderEntity: orderEntity);
    LoggerService().logDebug("""Payment total : ${paypalPaymentModel.amount.total},
    payment subtotal : ${paypalPaymentModel.amount.paymentDetailsModel.subTotal}   
    payment shipping : ${paypalPaymentModel.amount.paymentDetailsModel.shipping}   
    payment shipping discount : ${paypalPaymentModel.amount.paymentDetailsModel.shippingDiscount}   
    """);
    LoggerService().logDebug('Payment Model in json: ${paypalPaymentModel.toJson()}');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: AppSecretKeys.payPalClientId,
        secretKey: AppSecretKeys.payPalSecretKey,
        transactions: [
          paypalPaymentModel.toJson()
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async
        {
          Navigator.pop(context);
          buildSnackBarMessage(text: 'Payment done ,Congratulations', context: context);
          navigate(route: Routes.paymentRevisionScreen, context: context,args: orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          buildSnackBarMessage(text: 'Payment failed', context: context);
          LoggerService().logDebug('Error in payment $error');
        },
        onCancel: () {
          Navigator.pop(context);
          buildSnackBarMessage(text: 'Payment Cancelled', context: context);

        },
      ),
    ));
  }
}


