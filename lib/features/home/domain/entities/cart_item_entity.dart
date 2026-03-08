
import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';

class CartItemEntity extends Equatable
{
  final ProductEntity productEntity;
  int itemCount;

  CartItemEntity({required this.productEntity,this.itemCount=0});


  num calculateTotalPrice()
  {
    return productEntity.price  * itemCount;
  }

  num calculateTotalWeight()
  {
    return productEntity.unitOfCalories  * itemCount;
  }


  increaseItemCount()
  {
     itemCount++;
  }

  decreaseItemCount()
  {
     itemCount--;
  }
  @override
  List<Object?> get props => [productEntity];



}