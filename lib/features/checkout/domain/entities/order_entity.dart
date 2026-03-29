


import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';

class OrderEntity
{

   final CartsEntity carts;
   final ShippingAddressEntity shippingAddress;
   final bool payWithCash;
   final String orderId;


   const OrderEntity({required this.carts, required this.shippingAddress, required this.payWithCash,
   required this.orderId
   });



   OrderEntity copyWith({CartsEntity? carts,ShippingAddressEntity? shippingAddress,bool? payWithCash,
   String? orderId
   })
   {
      return OrderEntity(
          carts: carts??this.carts,
          orderId: orderId ?? this.orderId,
          shippingAddress: shippingAddress??this.shippingAddress,
          payWithCash: payWithCash??this.payWithCash);
   }


}