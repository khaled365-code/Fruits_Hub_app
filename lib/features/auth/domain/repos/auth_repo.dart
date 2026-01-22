


import 'package:dartz/dartz.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo
{


  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({required String email, required String password,required String name});



  Future<Either<Failure,UserEntity>> signInUsingEmailAndPassword({required String email,required String password});



  Future<Either<Failure,UserEntity>> signInWithGoogle();



  Future<Either<Failure,UserEntity>> signInWithFacebook();



  Future<void> addUserDataToDatabase({required UserEntity userEntity});


  Future<UserEntity> getUserData({required String userId});









}