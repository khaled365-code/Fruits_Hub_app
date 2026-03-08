


import 'dart:io';

import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable
{

  final String name;
  final String userImage;
  final num rate;
  final String description;
  final String dateTime;

  const ReviewEntity({
    required this.name,
    required this.rate,
    required this.description,
    required this.userImage,
    required this.dateTime
  });



  ReviewEntity copyWith({
    String? name,
    num? rate,
    String? description,
    String? userImage,
    String? dateTime
  })=>ReviewEntity(
      name: name ?? this.name,
      rate: rate ?? this.rate,
      description: description ?? this.description,
      userImage: userImage ?? this.userImage ,
      dateTime: dateTime??this.dateTime
  );

  @override
  List<Object?> get props => [name,rate,description,userImage,dateTime];








}