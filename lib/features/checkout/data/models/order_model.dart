

import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/special_product_model_to_database.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderModel
{


   final ShippingAddressModel shippingAddress;
   final String orderId;
   final String orderDate;
   final String userId;
   final String orderState;
   final String paymentMethod;
   final String orderPrice;
   final List<CustomProductModelToDatabase> orderDetails;

   const OrderModel({
     required this.orderId,
     required this.shippingAddress,
     required this.orderDate,
     required this.userId,
     this.orderState='Pending',
     required this.paymentMethod,
     required this.orderDetails,
     required this.orderPrice});


   factory OrderModel.fromEntity(OrderEntity orderEntity)
   {
     return OrderModel(
         orderId: orderEntity.orderId,
         shippingAddress: ShippingAddressModel.fromEntity(orderEntity.shippingAddress,),
         orderDate: DateTime.now().toString(),
         userId: getCurrentUserId(),
         paymentMethod: orderEntity.payWithCash==true?'Cash':'PayPal',
         orderPrice: calculatePriceAfterDiscountAndShipping(orderEntity.carts).toString(),
         orderDetails: List.from(orderEntity.carts.cartsList.map((item)=>CustomProductModelToDatabase.fromCartItemEntity(cartItem: item)))
        );

   }


  Map<String,dynamic> toJson()=>
      {
      BackendEndPoints.userId: userId,
      BackendEndPoints.orderId: orderId,
      BackendEndPoints.orderDate: orderDate,
      BackendEndPoints.orderPrice: orderPrice,
      BackendEndPoints.orderState: orderState,
      BackendEndPoints.orderPaymentMethod: paymentMethod,
      BackendEndPoints.orderDetails: List.from(orderDetails.map((item)=>item.toMap())),
      BackendEndPoints.orderAddress: shippingAddress.toMap()
  };


}

/*


      "order_date": ,
      "order_state": "Pending",
      "order_price": ,
      "user_id": ,
      "order_address": ,
      "order_payment_method": ,
      "order_details": []

 */