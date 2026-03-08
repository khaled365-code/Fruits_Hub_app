

import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/core/global/constants/backend_endpoints.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/review_entity.dart';

class ReviewModel extends Equatable
{

  final String name;
  final String userImage;
  final num rate;
  final String description;
  final String dateTime;

  ReviewModel({
    required this.name,
    required this.userImage,
    required this.rate,
    required this.description,
    required this.dateTime});


  factory ReviewModel.fromJson(Map<String,dynamic> json)
  {
    return ReviewModel(
        name: json[BackendEndPoints.name],
        userImage: json[BackendEndPoints.userImageUrl],
        rate: json[BackendEndPoints.rate],
        description: json[BackendEndPoints.description],
        dateTime: json[BackendEndPoints.dateTime]);
  }


  factory ReviewModel.fromEntity(ReviewEntity reviewEntity)
  {
    return ReviewModel(
        name: reviewEntity.name,
        userImage: reviewEntity.userImage,
        rate: reviewEntity.rate,
        description: reviewEntity.description,
        dateTime: reviewEntity.dateTime);

  }


  Map<String,dynamic> toMap()=>
  {
        BackendEndPoints.name:name,
        BackendEndPoints.userImageUrl:userImage,
        BackendEndPoints.rate:rate,
        BackendEndPoints.description:description,
        BackendEndPoints.dateTime:dateTime
  } ;

  @override
  List<Object?> get props => [name,userImage,rate,description,dateTime];










}