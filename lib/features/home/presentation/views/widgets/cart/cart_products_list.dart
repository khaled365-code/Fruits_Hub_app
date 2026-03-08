
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/cart/product_cart_item.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key,required this.cartsList});

  final List<CartItemEntity> cartsList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
    separatorBuilder: (context,index)=>Divider(
      height: 8,
      thickness: 1,
      color: AppColors.cF1F1F5,
    ),
    itemBuilder: (context,index)=> ProductCartItem(cartItemEntity: cartsList[index],),
     itemCount: cartsList.length,
    );
  }
}
