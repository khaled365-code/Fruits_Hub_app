



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    delaySplashScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Align(alignment: AlignmentDirectional.topEnd, child: SvgPicture.asset(ImageConstants.plantSplashIcon)),
          SvgPicture.asset(ImageConstants.appLogoIcon),
          SvgPicture.asset(ImageConstants.pointsCirclesIcon,fit: BoxFit.fitWidth,),


        ],
      ),
    ),);
  }


  void delaySplashScreen()
  {
     Future.delayed(Duration(seconds: 5),(){
      navigate(route: Routes.onBoardingScreen,
          context: context,replaced: true);
    });

  }
}
