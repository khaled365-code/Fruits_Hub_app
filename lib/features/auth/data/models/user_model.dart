


import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_commerce_app/core/global/constants/database_constants.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends Equatable
{

  final String name;
  final String email;
  final String userId;

  const UserModel({required this.name,required this.email,required this.userId});



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



  toJson()
  {
    Map<String,dynamic> data={};

    data[DatabaseConstants.name]=name;

    data[DatabaseConstants.email]=email;

    data[DatabaseConstants.userId]=userId;

    return data;

  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,userId];



  factory UserModel.FromEntity(UserEntity userEntity)
  {
    return UserModel(
    name: userEntity.name,
    email: userEntity.email,
    userId: userEntity.userId);

  }

}





