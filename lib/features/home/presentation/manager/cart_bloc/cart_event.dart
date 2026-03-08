part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}


final class AddCartItemEvent extends CartEvent
{
   final ProductEntity productEntity;
   AddCartItemEvent({required this.productEntity});

}


final class RemoveCartItemEvent extends CartEvent
{
    final CartItemEntity cartItemEntity;
    RemoveCartItemEvent({required this.cartItemEntity});
}

final class IncreaseItemCountEvent extends CartEvent
{
    final CartItemEntity cartItemEntity;
    IncreaseItemCountEvent({required this.cartItemEntity});
}

final class DecreaseItemCountEvent extends CartEvent
{
  final CartItemEntity cartItemEntity;
  DecreaseItemCountEvent({required this.cartItemEntity});
}