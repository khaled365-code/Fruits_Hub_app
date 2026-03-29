


import 'package:equatable/equatable.dart';

class OrderTrackingDetailsEntity  extends Equatable
{
   final String orderImage;
   final String orderCurrentState;
   final String orderValue;


   const OrderTrackingDetailsEntity({
     required this.orderImage,
     required this.orderCurrentState,
     required this.orderValue,
   });




  @override
  List<Object?> get props => [orderCurrentState];


}