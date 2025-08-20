


import 'package:flutter/material.dart';


navigate({required String route,required BuildContext context,bool replaced=false,Object? args})
{

  replaced==true?
      Navigator.pushReplacementNamed(context, route,arguments: args):
      Navigator.pushNamed(context, route,arguments: args);

}

