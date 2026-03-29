


import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';

abstract class CheckoutRepo
{

  Future<Either<Failure,String>> placeOrder({required OrderEntity orderEntity});




}