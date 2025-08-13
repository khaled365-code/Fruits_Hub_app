import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';

import 'fruits_shop_app.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const FruitsShopApp());
}



