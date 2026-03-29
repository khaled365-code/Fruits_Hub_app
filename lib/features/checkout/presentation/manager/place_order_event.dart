part of 'place_order_bloc.dart';

@immutable
sealed class PlaceOrderEvent {}




final class AddOrderEvent extends PlaceOrderEvent {

  final OrderEntity orderEntity;

  AddOrderEvent({required this.orderEntity});

}
