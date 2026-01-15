


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/widgets/signup/custom_check_box.dart';

class ConditionsAcceptanceRow extends StatelessWidget {
  const ConditionsAcceptanceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        CustomCheckBox(),
        SpaceWidget(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [

            RichText(
              text: TextSpan(
              children:
              [
                TextSpan(text: 'من خلال إنشاء حساب ، فإنك توافق على',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.c949D9E
                ),),
                TextSpan(text:' الشروط',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.lightPrimaryColor
                ))
              ]
            ),),
            Text('والأحكام الخاصة بنا',style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.lightPrimaryColor
            ),)
          ],
        )


      ],
    );
  }
}

