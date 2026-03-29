

import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';

class CartsEntity
{

   final List<CartItemEntity> cartsList;

   const CartsEntity({required this.cartsList});




   void addProductToCarts({required ProductEntity productEntity})
   {
     for (var item in cartsList)
       {
         if(productEntity==item.productEntity)
           {
             item.increaseItemCount();
             return;
           }
       }

     cartsList.add(CartItemEntity(productEntity: productEntity,itemCount: 1));

   }

   removeCartItem({required CartItemEntity cartItem})
   {
     cartsList.remove(cartItem);
   }


   num calculateAllCartsPrice()
   {
      num sum=0;
      for(var item in cartsList)
        {
          sum+=item.calculateTotalPrice();
        }
      return sum;
   }





}