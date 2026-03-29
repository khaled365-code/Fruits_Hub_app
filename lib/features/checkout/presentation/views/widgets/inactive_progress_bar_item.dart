


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/progress_bar_data_entity.dart';

class InactiveProgressBarItem extends StatelessWidget {
  const InactiveProgressBarItem({super.key,required this.progressEntityItem});

  final ProgressBarDataEntity progressEntityItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(shape: OvalBorder(),
              color: AppColors.cF2F3F3
          ),
          child: Center(child:Text(progressEntityItem.itemNum.toString(),style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textColors[ThemeCubit().currentTheme]
          ),)),
        ),
        const SpaceWidget(width: 5.5,),
        Text(progressEntityItem.itemName,style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.cAAAAAA,
        ),)

      ],
    );
  }
}
