
import 'package:fruits_commerce_app/features/home/data/models/review_model.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/review_entity.dart';

abstract class ReviewModelToEntity
{

  static ReviewEntity convertReviewModelToEntity({required ReviewModel reviewModel})
  {
    return ReviewEntity(
        name: reviewModel.name,
        rate: reviewModel.rate,
        description: reviewModel.description,
        userImage: reviewModel.userImage,
        dateTime: reviewModel.dateTime,);
  }



}