import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';

import 'fruits_shop_app.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await locator<CacheService>().init();
  runApp(const FruitsShopApp());

}



