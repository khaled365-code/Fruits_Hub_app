

import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/data/models/product_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartItemModel
{
  final ProductModel productModel;
  final int itemCount;


  const CartItemModel({required this.productModel,required this.itemCount});


  factory CartItemModel.fromEntity(CartItemEntity cartItemEntity)
  {
    return CartItemModel(
        productModel: ProductModel.fromEntity(cartItemEntity.productEntity),
        itemCount: cartItemEntity.itemCount);
  }

  Map<String,dynamic> toMap()
  {
    return
    {
       BackendEndPoints.product:productModel.toJson(),
       BackendEndPoints.itemCount:itemCount
    };

  }









}