


import 'package:equatable/equatable.dart';

class USerEntity extends Equatable
{
  final String name;
  final String email;
  final String userId;


  const USerEntity({required this.name,required this.email,required this.userId});

  @override
  List<Object?> get props => [name,email,userId];




}