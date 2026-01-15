


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class MostSoldRow extends StatelessWidget {
  const MostSoldRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text('الاكثر مبيعا',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: AppColors.textColors[ThemeCubit().currentTheme])),
        Spacer(),
        Text('المزيد',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.c949D9E
        ),)

      ],
    );
  }
}
