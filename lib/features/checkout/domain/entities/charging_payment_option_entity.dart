

import 'package:equatable/equatable.dart';

class ChargingPaymentOptionEntity extends Equatable
{

  final String paymentType;
  final String paymentDetails;
  final String price;

  const ChargingPaymentOptionEntity({required this.paymentType, required this.paymentDetails, required this.price});

  @override
  List<Object?> get props => [paymentType,paymentDetails,price];


}