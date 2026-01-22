



import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_commerce_app/features/auth/data/mapper/user_model_to_domain.dart';
import 'package:fruits_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_commerce_app/features/auth/domain/repos/auth_repo.dart';
import '../../../../core/global/constants/backend_endpoints.dart';

class AuthRepoImplementationUsingFirebase extends AuthRepo
{

  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImplementationUsingFirebase({required this.firebaseAuthService,required this.databaseService});


  @override
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({required String email, required String password,required String name}) async
  {
    User? user;
    try
    {
      user = await firebaseAuthService.createUserWithEmailAndPasswordService(email: email, password: password);
      UserModel userModel=UserModel.fromFirebaseAuth(user); // fetching user data from firebase auth
      UserEntity userEntity=UserModelToDomain.convertUserModelToUserEntity(userModel: userModel); // convert user model to user entity
      await addUserDataToDatabase(userEntity: userEntity.copyWith(name: name));
      return Right(userEntity.copyWith(name: name));
    } catch (e)
    {
      if(user!=null)
        {
          await firebaseAuthService.deleteAccount();
        }
     if(kDebugMode)
       {
         log('Exception in AuthRepoImplementation.createUserWithEmailAndPasswordService : the exception is ${e.toString()}');
       }
      return Left(Failure.handleFailures(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInUsingEmailAndPassword({required String email, required String password}) async {
    try
    {
      User user = await firebaseAuthService.signInUsingEmailAndPassword(email: email, password: password);
      UserEntity userEntity = await getUserData(userId: user.uid);
      return Right(userEntity);
    } catch (e)
    {
      if(kDebugMode)
        {
          log('Exception in AuthRepoImpl.signInUsingEmailAndPassword is : ${e.toString()}');
        }
       return Left(Failure.handleFailures(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async
  {
    User? user;
    try
    {
     user=  await firebaseAuthService.signInWithGoogle();
     UserModel userModel=UserModel.fromFirebaseAuth(user);
     bool recordExists = await databaseService.checkIfRecordExists(path: BackendEndPoints.usersCollectionName, recordId: userModel.userId);
     if(recordExists)
       {
         await getUserData(userId: userModel.userId);
       }
     else
       {

         await addUserDataToDatabase(userEntity: UserModelToDomain.convertUserModelToUserEntity(userModel: userModel));
       }
     return Right(UserModelToDomain.convertUserModelToUserEntity(userModel: userModel));
    } catch (e)
    {
      if(user!=null)
        {
          await firebaseAuthService.deleteAccount();
        }
     if(kDebugMode)
       {
         log('Exception in AuthRepoImpl.signInWithGoogle the exception is ${e.toString()}');
       }
      return Left(Failure.handleFailures(e));

    }

  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async
  {
    User? user;
    try
    {
      user = await firebaseAuthService.signInWithFacebook();
      UserModel userModel=UserModel.fromFirebaseAuth(user);
      bool recordExists = await databaseService.checkIfRecordExists(path: BackendEndPoints.usersCollectionName, recordId: userModel.userId);
      if(recordExists)
      {
        await getUserData(userId: userModel.userId);
      }
      else
      {
        await addUserDataToDatabase(userEntity: UserModelToDomain.convertUserModelToUserEntity(userModel: userModel));
      }
      return Right(UserModelToDomain.convertUserModelToUserEntity(userModel: userModel));
    } catch (e)
    {
      if(user!=null)
      {
        await firebaseAuthService.deleteAccount();
      }
     if(kDebugMode)
       {
         log('Exception in AuthRepoImpl.signInWithFacebook the exception is ${e.toString()}');
       }
      return Left(Failure.handleFailures(e));
    }
  }
  @override
  Future<void> addUserDataToDatabase({required UserEntity userEntity}) async
  {
    await databaseService.add(path: BackendEndPoints.usersCollectionName, data:
    UserModel(name: userEntity.name, email: userEntity.email, userId: userEntity.userId).toJson(),recordId: userEntity.userId);
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async
  {
    var result= await databaseService.getData(path: BackendEndPoints.usersCollectionName,record_id: userId);
    return UserModelToDomain.convertUserModelToUserEntity(userModel: UserModel.fromJson(result));
  }





}

