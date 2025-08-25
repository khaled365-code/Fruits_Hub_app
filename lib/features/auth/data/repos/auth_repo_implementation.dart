



import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_commerce_app/core/errors/failure.dart';
import 'package:fruits_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo
{

  final FirebaseAuthService firebaseAuthService;
  const AuthRepoImplementation({required this.firebaseAuthService});


  @override
  Future<Either<Failure,USerEntity>> createUserWithEmailAndPassword({required String email, required String password,required String name}) async
  {
    try
    {
      User user = await firebaseAuthService.createUserWithEmailAndPasswordService(email: email, password: password);
      UserModel userModel=UserModel.fromFirebaseAuth(user);
      return Right(userModel);
    } catch (e)
    {
      return Left(Failure.handleFailures(e));
    }
  }


}

