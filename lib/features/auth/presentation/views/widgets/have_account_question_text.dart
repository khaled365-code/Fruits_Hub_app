

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

class HaveAccountQuestionText extends StatelessWidget {
  const HaveAccountQuestionText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onSecondTextPressed
  });

  final String firstText,secondText;
  final VoidCallback onSecondTextPressed;

  @override
  Widget build(BuildContext context) {

    return RichText(
      text: TextSpan(
          children:
          [
            TextSpan(text:firstText,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.c949D9E
            ),),
            TextSpan(text: ' '),
            TextSpan(
              recognizer: TapGestureRecognizer()
              ..onTap = onSecondTextPressed,
              text: secondText ,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColor
            ),)
          ]
      ),);
  }
}
