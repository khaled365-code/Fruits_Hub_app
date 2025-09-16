


import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_commerce_app/core/global/constants/database_constants.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity
{


  const UserModel({required super.name,required super.email,required super.userId});



  factory UserModel.fromFirebaseAuth(User user)
  {

    return UserModel(
        name: user.displayName??'',
        email: user.email??'',
        userId: user.uid);

  }


  factory UserModel.fromJson(Map<String,dynamic> json)
  {
    return UserModel(
        name: json[DatabaseConstants.name],
        email: json[DatabaseConstants.email],
        userId: json[DatabaseConstants.userId]);
  }






}