


import 'package:flutter/material.dart';

navigate({required String route,required BuildContext context,bool replaced=false})
{

  replaced==true?
      Navigator.pushReplacementNamed(context, route):
      Navigator.pushNamed(context, route);

}