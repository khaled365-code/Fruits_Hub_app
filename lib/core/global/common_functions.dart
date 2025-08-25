


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';


navigate({required String route,required BuildContext context,bool replaced=false,Object? args})
{

  replaced==true?
      Navigator.pushReplacementNamed(context, route,arguments: args):
      Navigator.pushNamed(context, route,arguments: args);

}


buildSnackBarMessage({required String text,required BuildContext context,bool errorMessage=false})
{

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children:
      [
        errorMessage==true?
        SvgPicture.asset(ImageConstants.errorIcon,colorFilter:
        ColorFilter.mode(Colors.white, BlendMode.srcIn),):SizedBox.shrink(),
        errorMessage==true?
        SpaceWidget(width: 10,):SizedBox.shrink(),
        Text(text,style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white
        ),),
      ],
    ),
  ));

}

