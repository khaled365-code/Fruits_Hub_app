import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/bloc_observer/my_bloc_observer.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';

import 'fruits_shop_app.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await CacheService().init();
  runApp(const FruitsShopApp());
  Bloc.observer=FruitsHubBlocObserver();

}



