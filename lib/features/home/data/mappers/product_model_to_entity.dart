


import 'package:fruits_commerce_app/features/home/data/mappers/review_model_to_entity.dart';
import 'package:fruits_commerce_app/features/home/data/models/product_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class ProductModelToEntity
{

  static ProductEntity convertProductModelToEntity({required ProductModel productModel}) {
    return ProductEntity(
        name: productModel.name,
        imageUrl: productModel.image,
        description: productModel.description,
        price: productModel.price,
        isFeatured: productModel.isFeatured,
        expirationMonths: productModel.expMonths,
        isOrganic: productModel.isOrganic,
        calories: productModel.calories,
        unitOfCalories: productModel.caloriesUnits,
        ratingCount: productModel.ratingCount,
        averageRate: productModel.averageRate,
        code: productModel.code,
        reviewsEntityList: List.from(productModel.reviewsModelList.map((item) =>
            ReviewModelToEntity.convertReviewModelToEntity(
                reviewModel: item))));
   }
}