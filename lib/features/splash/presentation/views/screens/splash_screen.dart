



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
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
          Align(alignment: LocalizationCubit().currentLanguage=='ar'? AlignmentDirectional.topEnd:AlignmentDirectional.topStart, child: SvgPicture.asset(ImageConstants.plantSplashIcon)),
          SvgPicture.asset(ImageConstants.appLogoIcon),
          SvgPicture.asset(ImageConstants.pointsCirclesIcon,fit: BoxFit.fitWidth,),


        ],
      ),
    ),);
  }


  Future<void> delaySplashScreen() async
  {

     await Future.delayed(Duration(seconds: 5),()
     {
       CacheService().getBool(key: AppConstants.userIsLoggedInAccount)==true?
       navigate(route: Routes.homeScreen, context: context):
       CacheService().getBool(key: AppConstants.onBoardIsOpened)== true ?
       navigate(route: Routes.loginScreen, context: context):
       navigate(route: Routes.onBoardingScreen, context: context);
    });



  }
}
