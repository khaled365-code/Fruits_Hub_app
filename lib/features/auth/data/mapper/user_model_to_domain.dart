

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

abstract class UserModelToDomain
{

   static convertUserModelToUserEntity({required UserModel userModel})
   {
     return UserEntity(
     name: userModel.name,
     email: userModel.email,
     userId: userModel.userId);

   }


}

