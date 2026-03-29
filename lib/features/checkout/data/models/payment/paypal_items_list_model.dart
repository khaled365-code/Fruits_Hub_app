


import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_item_model.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_shipping_address_model.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';

class PaypalItemsListModel
{

  final List<PaypalPurchaseItemModel> items;
  final PaypalShippingAddressModel paypalShippingAddressModel;

 const PaypalItemsListModel({required this.items, required this.paypalShippingAddressModel});

   factory PaypalItemsListModel.fromOrderEntity({required OrderEntity orderEntity})
   {
     return PaypalItemsListModel(
         paypalShippingAddressModel: PaypalShippingAddressModel.fromShippingAddressEntity(shippingAddressEntity: orderEntity.shippingAddress),
         items: List.from(orderEntity.carts.cartsList.map<PaypalPurchaseItemModel>((cartItem)=>PaypalPurchaseItemModel.fromCartItemEntity(cartItemEntity: cartItem)))
     );
   }

 toJson()=>
     {
       BackendEndPoints.items:List.from(items.map((item)=>item.toJson())),
       //BackendEndPoints.shippingAddress:paypalShippingAddressModel.toJson()
     };



}