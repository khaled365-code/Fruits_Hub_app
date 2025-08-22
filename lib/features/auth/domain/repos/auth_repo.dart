


import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo
{

  Future<Future<Either<Failure,USerEntity>>> createUserWithEmailAndPassword({required String email, required String password});







}