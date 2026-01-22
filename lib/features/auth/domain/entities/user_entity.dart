


import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/features/auth/data/models/user_model.dart';

import '../../../../core/global/constants/database_constants.dart';

class UserEntity extends Equatable
{
  final String name;
  final String email;
  final String userId;


  const UserEntity({required this.name,required this.email,required this.userId});

  @override
  List<Object?> get props => [name,email,userId];


  UserEntity copyWith({String? name,String? email,String? userId})
  {
    return UserEntity(
        name: name??this.name,
        email: email??this.email,
        userId: userId??this.userId);
  }




}