


import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';

class PaypalDetailsModel
{
    final String subTotal;
    final String shipping;
    final int shippingDiscount;


    const PaypalDetailsModel({required this.subTotal,
    required this.shipping,
    required this.shippingDiscount
    });


    factory PaypalDetailsModel.fromCartsEntity(CartsEntity cartsEntity)
    {
      return PaypalDetailsModel(
          subTotal: cartsEntity.calculateAllCartsPrice().toInt().toString(),
          shipping: AppConstants.shippingPrice.toString(),
          shippingDiscount: calculateShippingDiscount().toInt());

    }



    Map<String,dynamic> toJson()
    {
      Map<String,dynamic> myMap = {};
      myMap[BackendEndPoints.subTotal]=subTotal;
      myMap[BackendEndPoints.shipping]=shipping;
      myMap[BackendEndPoints.shippingDiscount]=shippingDiscount;
      return myMap;
    }

}