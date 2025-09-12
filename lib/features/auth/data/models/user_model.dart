


import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends USerEntity
{


  const UserModel({required super.name,required super.email,required super.userId});



  factory UserModel.fromFirebaseAuth(User user)
  {

    return UserModel(
        name: user.displayName??'',
        email: user.email??'',
        userId: user.uid);

  }







}