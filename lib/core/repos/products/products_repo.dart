


import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';

import '../../../features/home/domain/entities/product_entity.dart';

abstract class ProductsRepo
{

  Future<Either<Failure,List<ProductEntity>>> getAllProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();




}