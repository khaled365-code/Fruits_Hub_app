

import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/data/models/review_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';

class ProductModel extends Equatable
{

  final String name;
  final String image;
  final num price;
  final String description;
  final int expMonths;
  final int calories;
  final int caloriesUnits;
  final bool isOrganic;
  final bool isFeatured;
  final int ratingCount;
  final num averageRate;
  final String code;
  final List<ReviewModel> reviewsModelList;

  ProductModel({
    required this.name,
    required this.image, required this.price,
    required this.description, required this.expMonths,
    required this.calories, required this.caloriesUnits,
    required this.isOrganic, required this.isFeatured,
    required this.ratingCount, required this.averageRate,
    required this.reviewsModelList, required this.code});


  factory ProductModel.fromJson(Map<String,dynamic> json)
  {
    return ProductModel(
        name: json[BackendEndPoints.name],
        image: json[BackendEndPoints.imageUrl],
        price: json[BackendEndPoints.price],
        description: json[BackendEndPoints.description],
        expMonths: json[BackendEndPoints.expirationMonths],
        calories: json[BackendEndPoints.calories],
        caloriesUnits: json[BackendEndPoints.unitOfCalories],
        isOrganic: json[BackendEndPoints.isOrganic],
        isFeatured: json[BackendEndPoints.isFeatured],
        code: json[BackendEndPoints.code],
        ratingCount: List.from(json[BackendEndPoints.reviews].map((item)=>ReviewModel.fromJson(item))).length,
        averageRate: getAvgRate(reviews : List.from(json[BackendEndPoints.reviews].map((item)=>ReviewModel.fromJson(item)))),
        reviewsModelList: List.from(json[BackendEndPoints.reviews].map((item)=>ReviewModel.fromJson(item))));

  }


  factory ProductModel.fromEntity(ProductEntity proEntity)
  {

    return ProductModel(
        name: proEntity.name,
        image: proEntity.imageUrl,
        price: proEntity.price,
        description: proEntity.description,
        expMonths: proEntity.expirationMonths,
        calories: proEntity.calories,
        caloriesUnits: proEntity.unitOfCalories,
        isOrganic: proEntity.isOrganic,
        isFeatured: proEntity.isFeatured,
        ratingCount: proEntity.ratingCount,
        averageRate: proEntity.averageRate,
        code: proEntity.code,
        reviewsModelList: List.from(proEntity.reviewsEntityList.map((item)=>ReviewModel.fromEntity(item))));
  }

  @override
  List<Object?> get props => [
    name,image,price,description,
    expMonths,calories,caloriesUnits,
    isOrganic,isFeatured,ratingCount,
    averageRate,reviewsModelList];


  Map<String,dynamic> toJson()
  {
    return {
      BackendEndPoints.name:name,
      BackendEndPoints.imageUrl:image,
      BackendEndPoints.price:price,
      BackendEndPoints.description:description,
      BackendEndPoints.expirationMonths:expMonths,
      BackendEndPoints.calories:calories,
      BackendEndPoints.unitOfCalories:caloriesUnits,
      BackendEndPoints.isOrganic:isOrganic,
      BackendEndPoints.isFeatured:isFeatured,
      BackendEndPoints.ratingCount:ratingCount,
      BackendEndPoints.averageRate:averageRate,
      BackendEndPoints.reviews:reviewsModelList.map<Map<String,dynamic>>((item)=>item.toMap()).toList(),


    };


  }




}