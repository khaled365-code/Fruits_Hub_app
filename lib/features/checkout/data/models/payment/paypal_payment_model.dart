

import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_amount_model.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/payment/paypal_items_list_model.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';

class PaypalPaymentModel
{
  final PaypalAmountModel amount;
  final String description;
  final PaypalItemsListModel paypalItemsListModel;

  const PaypalPaymentModel({required this.amount, required this.description, required this.paypalItemsListModel});


  factory PaypalPaymentModel.fromOrderEntity({required OrderEntity orderEntity})
  {
    return PaypalPaymentModel(
        amount: PaypalAmountModel.FromCartsEntity(orderEntity.carts),
        description: 'Order For Payment',
        paypalItemsListModel: PaypalItemsListModel.fromOrderEntity(orderEntity: orderEntity));
  }

  toJson()=>
  {
    BackendEndPoints.amount:amount.toJson(),
    BackendEndPoints.description:description,
    BackendEndPoints.itemList:paypalItemsListModel.toJson()

  };


}