

/*

      "name": "Apple",
      "quantity": 4,
      "price": "5",
      "currency": "USD"
 */


import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class PaypalPurchaseItemModel
{

  final String name;
  final int quantity;
  final String price;
  final String currency;

  const PaypalPurchaseItemModel({required this.name, required this.quantity, required this.price, required this.currency});


  factory PaypalPurchaseItemModel.fromCartItemEntity({required CartItemEntity cartItemEntity})
  {
    return PaypalPurchaseItemModel(
        name: cartItemEntity.productEntity.name,
        quantity: cartItemEntity.itemCount,
        price: cartItemEntity.productEntity.price.toString(),
        currency: AppConstants.appCurrentCurrency);
  }


  toJson()=>{
    BackendEndPoints.name:name,
    BackendEndPoints.quantity:quantity,
    BackendEndPoints.price:price,
    BackendEndPoints.currency:currency,
  };







}