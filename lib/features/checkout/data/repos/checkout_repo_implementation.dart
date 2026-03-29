



import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';
import 'package:fruits_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/domain/repos/checkout_repo.dart';

class CheckoutRepoImplementation extends CheckoutRepo
{

  final DatabaseService databaseService;

  CheckoutRepoImplementation({required this.databaseService});

  @override
  Future<Either<Failure,String>> placeOrder({required OrderEntity orderEntity}) async
  {
     try
     {

       final result = await databaseService.add(path: BackendEndPoints.ordersCollectionName,
           data: OrderModel.fromEntity(orderEntity).toJson(),
           recordId: OrderModel.fromEntity(orderEntity).orderId);

       return Right('order Added Successfully');

     }
     catch (e)
    {
        LoggerService().logDebug('Exception in CheckoutRepoImplementation.placeOrder ad the exception is : $e');
        return Left(Failure.handleFailures(e));
    }
  }








}