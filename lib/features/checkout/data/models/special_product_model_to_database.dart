


import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CustomProductModelToDatabase
{

  final String productCode;
  final String productName;
  final String totalPrice;
  final int quantity;
  final String productImage;
  final bool isFeatured;

  CustomProductModelToDatabase({
    required this.productCode,
    required this.productName,
    required this.totalPrice,
    required this.quantity,
    required this.productImage,
    required this.isFeatured});




  factory CustomProductModelToDatabase.fromCartItemEntity({required CartItemEntity cartItem})
  {
    return CustomProductModelToDatabase(
      isFeatured: cartItem.productEntity.isFeatured,
      productName: cartItem.productEntity.name,
      totalPrice: cartItem.calculateTotalPrice().toString(),
      quantity: cartItem.itemCount,
      productImage: cartItem.productEntity.imageUrl,
      productCode: cartItem.productEntity.code
    );


  }

  toMap()=> {
     BackendEndPoints.productCode:productCode,
     BackendEndPoints.productName:productName,
     BackendEndPoints.productPrice:totalPrice,
     BackendEndPoints.quantity:quantity,
     BackendEndPoints.productImage:productImage,
     BackendEndPoints.productIsFeatured:isFeatured,
      };







}