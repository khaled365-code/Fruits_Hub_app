

import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:get_it/get_it.dart';

final locator=GetIt.instance;


setUpLocator()
{

  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit(),);






}