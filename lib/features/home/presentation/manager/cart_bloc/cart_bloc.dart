import 'package:bloc/bloc.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/carts_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartsEntity carts=CartsEntity(cartsList: []);
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {

      if (event is AddCartItemEvent)
        {
          carts.addProductToCarts(productEntity: event.productEntity);
          emit(CartItemAdded());
        }
      if (event is RemoveCartItemEvent)
        {
          carts.removeCartItem(cartItem: event.cartItemEntity);
          emit(CartItemRemoved());
        }
      if (event is IncreaseItemCountEvent)
        {
          event.cartItemEntity.increaseItemCount();
          emit(UpdateCartItemState());

        }
      if (event is DecreaseItemCountEvent)
      {
        event.cartItemEntity.decreaseItemCount();
        emit(UpdateCartItemState());
      }

    });
  }
}
