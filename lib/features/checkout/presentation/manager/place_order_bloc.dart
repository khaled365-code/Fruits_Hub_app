import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/core/global/constants/enums.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent,PlaceOrderState> {

  final CheckoutRepo checkoutRepo;

  PlaceOrderBloc({required this.checkoutRepo}) : super(PlaceOrderState()) {

    on<PlaceOrderEvent>((event, emit) async {
      if (event is AddOrderEvent)
        {
          emit(state.copyWith(placeOrderRequestState: RequestStates.loading));
          final result= await checkoutRepo.placeOrder(orderEntity: event.orderEntity);
          result.fold((failure)=>emit(state.copyWith(placeOrderRequestState: RequestStates.error,
          PlaceOrderErrorM: failure.callBack
          )),(message)=>emit(state.copyWith(placeOrderRequestState: RequestStates.success,PlaceOrderSuccessM: message)));
        }
    });
  }
}
