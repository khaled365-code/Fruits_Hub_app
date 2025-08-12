



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
}
