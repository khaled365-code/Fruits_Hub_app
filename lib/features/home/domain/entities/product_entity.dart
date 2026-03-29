





import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/review_entity.dart';

class ProductEntity extends Equatable
{

  final String name;
  final String imageUrl;
  final String description;
  final num price;
  final bool isFeatured;
  final int expirationMonths;
  final bool isOrganic;
  final int calories;
  final int unitOfCalories;
  final int ratingCount;
  final num averageRate;
  final String code;
  final List<ReviewEntity> reviewsEntityList;


  const ProductEntity(
      {
        required this.name,
        required this.imageUrl,
        required this.description,
        required this.price,
        required this.isFeatured,
        required this.expirationMonths,
        required this.isOrganic,
        required this.calories,
        required this.unitOfCalories,
        required this.ratingCount,
        required this.averageRate,
        required this.reviewsEntityList, required this.code,

      });


  ProductEntity copyWith({
    String? name ,String? description,
    num? price,bool? isFeatured, String? imageUrl,
    int? expirationMonths,
    bool? isOrganic,
    int? calories,
    int? unitOfCalories,
    int? ratingCount,
    num? averageRate,
    String? code,
    List<ReviewEntity>? reviewsEntityList
  })
  {
    return ProductEntity(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        price: price ?? this.price,
        isFeatured: isFeatured ?? this.isFeatured,
        expirationMonths: expirationMonths??this.expirationMonths,
        calories: calories??this.calories,
        isOrganic: isOrganic ?? this.isOrganic,
        unitOfCalories: unitOfCalories??this.unitOfCalories,
        averageRate: averageRate??this.averageRate,
        ratingCount: ratingCount??this.ratingCount,
        code: code ?? this.code,
        reviewsEntityList: reviewsEntityList ?? this.reviewsEntityList
    );
  }

  @override
  List<Object?> get props => [
    name,description,price,isFeatured,imageUrl,
    expirationMonths,calories,isOrganic,unitOfCalories,averageRate,ratingCount,reviewsEntityList,code
  ];







}