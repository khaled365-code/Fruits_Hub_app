


import 'package:equatable/equatable.dart';

import '../../../../core/global/constants/database_constants.dart';

class UserEntity extends Equatable
{
  final String name;
  final String email;
  final String userId;


  const UserEntity({required this.name,required this.email,required this.userId});

  @override
  List<Object?> get props => [name,email,userId];


  toJson()=> {
    DatabaseConstants.name:name,
    DatabaseConstants.email:email,
    DatabaseConstants.userId:userId
  };




}