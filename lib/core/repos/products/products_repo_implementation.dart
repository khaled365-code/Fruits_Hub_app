

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/core/repos/products/products_repo.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';
import 'package:fruits_commerce_app/features/home/data/mappers/product_model_to_entity.dart';
import 'package:fruits_commerce_app/features/home/data/models/product_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';

class ProductsRepoImplementation extends ProductsRepo
{ 
  
  final DatabaseService databaseService;
  ProductsRepoImplementation({required this.databaseService});


  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async
  {
    try
    {
       final result = await databaseService.getCollectionData(path: BackendEndPoints.productsCollectionName);
       List<ProductModel> productsList=List.from(result.map((item)=>ProductModel.fromJson(item)));
       return Right(productsList.map((item)=>ProductModelToEntity.convertProductModelToEntity(productModel: item)).toList());
      
    } catch (e)
    {
        return Left(Failure.handleFailures(e));
    }


  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
     try
     {
       final result = await databaseService.getFilteredCollectionData(path: BackendEndPoints.productsCollectionName,
         filter: {
           'orderBy':'bestSelling',
           'descending':true,
           'limit':10
         });

       List<ProductEntity> productMList=
       result.map((item)=> ProductModel.fromJson(item)).toList().map((item)=>ProductModelToEntity.convertProductModelToEntity(productModel: item)).toList();
       return Right(productMList);
     } catch (e)
     {
       LoggerService().logDebug('Exception in ProductsRepoImplementation.getBestSellingProducts and the exception : $e');
        return Left(Failure.handleFailures(e));

     }
  }






}