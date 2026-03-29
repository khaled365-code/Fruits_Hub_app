part of 'place_order_bloc.dart';

@immutable
final class PlaceOrderState
{

  final RequestStates placeOrderRequestState;
  final String PlaceOrderErrorM;
  final String PlaceOrderSuccessM;


  const PlaceOrderState({
     this.placeOrderRequestState=RequestStates.initial,
     this.PlaceOrderErrorM='',
     this.PlaceOrderSuccessM=''
  });



  PlaceOrderState copyWith({
    RequestStates? placeOrderRequestState,
    String? PlaceOrderErrorM,
    String? PlaceOrderSuccessM
  })
  {
    return PlaceOrderState(
      placeOrderRequestState: placeOrderRequestState ?? this.placeOrderRequestState,
      PlaceOrderErrorM: PlaceOrderErrorM ?? this.PlaceOrderErrorM,
      PlaceOrderSuccessM: PlaceOrderSuccessM ?? this.PlaceOrderSuccessM
    );
  }



}

