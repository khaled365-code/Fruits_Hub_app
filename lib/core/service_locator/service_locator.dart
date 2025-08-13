

import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final locator=GetIt.instance;


setUpLocator()
{


  locator.registerFactory<ThemeCubit>(() => ThemeCubit(),);





}