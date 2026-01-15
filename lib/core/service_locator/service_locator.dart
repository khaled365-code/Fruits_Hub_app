

import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_commerce_app/core/services/firestore_service.dart';
import 'package:fruits_commerce_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruits_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


setUpLocator()
{

  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit(),);
  locator.registerLazySingleton<LocalizationCubit>(()=>LocalizationCubit());
  locator.registerFactory<SignupCubit>(() => SignupCubit(authRepo: locator()),);
  locator.registerFactory<LoginBloc>(() => LoginBloc(
  authRepo: locator()
  ),);
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImplementationUsingFirebase(
      firebaseAuthService: locator(),
      databaseService: locator()),);
  locator.registerLazySingleton<FirebaseAuthService>(()=>FirebaseAuthService());
  locator.registerLazySingleton<DatabaseService>(() => FireStoreService(),);




}