


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/features/splash/presentation/views/screens/splash_screen.dart';

class AppRouter
{

  static Route? onGenerateRoutes(RouteSettings settings)
  {

    switch(settings.name)
    {
      case Routes.splashScreen:
        return _buildScreen(widget: SplashScreen());


      default:
        return _buildDefaultRoute();


    }






  }



  static MaterialPageRoute _buildScreen({required Widget widget,RouteSettings? settings})
  => MaterialPageRoute(builder: (context) => widget,settings: settings);


  static MaterialPageRoute _buildDefaultRoute()=>MaterialPageRoute(builder: (context)=>
      Scaffold(
          body: SafeArea(
            child: Center(
              child: Text('Wrong Route'),
            ),
          ),
        ),
      );



}


