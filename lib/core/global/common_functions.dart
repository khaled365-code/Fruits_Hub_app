


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        Text(text,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.white
        ),),
      ],
    ),
  ),);

}

