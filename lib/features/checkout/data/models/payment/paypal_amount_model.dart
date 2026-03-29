


import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_details_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';

class PaypalAmountModel
{
   final String total;
   final String currency;
   final PaypalDetailsModel paymentDetailsModel;

  PaypalAmountModel({
    required this.total,
    required this.currency,
    required this.paymentDetailsModel});


  factory PaypalAmountModel.FromCartsEntity(CartsEntity cartsEntity)
  {
    return PaypalAmountModel(
      total: calculatePriceAfterDiscountAndShipping(cartsEntity).toInt().toString(),
      currency: AppConstants.appCurrentCurrency,
      paymentDetailsModel: PaypalDetailsModel.fromCartsEntity(cartsEntity)
    );
  }



  toJson()=>{
    BackendEndPoints.total:total,
    BackendEndPoints.currency:currency,
    BackendEndPoints.details:paymentDetailsModel.toJson(),
  };


}