


import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/cart_item_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/carts_entity.dart';

class CartsModel
{

  final List<CartItemModel> cartsList;

  const CartsModel({required this.cartsList});



  factory CartsModel.fromEntity(CartsEntity cartsEntity)
  {
    return CartsModel(cartsList: cartsEntity.cartsList.map((item)=>CartItemModel.fromEntity(item)).toList());
  }



  Map<String,dynamic> toMap()
  {
    return {
      BackendEndPoints.cartData: List.from(cartsList.map<Map<String,dynamic>>((item)=>item.toMap()))
    };
  }





}