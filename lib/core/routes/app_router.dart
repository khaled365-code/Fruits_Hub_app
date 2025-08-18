


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:fruits_commerce_app/features/splash/presentation/views/screens/splash_screen.dart';

class AppRouter
{

  static Route? onGenerateRoutes(RouteSettings settings)
  {

    switch(settings.name)
    {
      case Routes.splashScreen:
        return _buildScreen(widget: SplashScreen());
      case Routes.onBoardingScreen:
        return _buildScreen(widget: OnBoardingScreen());
      case Routes.loginScreen:
        return _buildScreen(widget: LoginScreen());


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


