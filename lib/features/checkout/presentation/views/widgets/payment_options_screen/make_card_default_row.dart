

import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/check_box_widget.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class MakeCardDefaultRow extends StatelessWidget {
  const MakeCardDefaultRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckBoxWidget(),
        const SpaceWidget(width: 15,),
        Text('جعل البطاقة افتراضية',style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.c616A6B
        ),),
      ],
    );
  }
}
