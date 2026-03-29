
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class SelectCircleContainer extends StatelessWidget {
  const SelectCircleContainer({super.key,required this.isSelected});

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected==true?
    Container(
      padding : EdgeInsets.all(4.5),
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: OvalBorder(),
      ),
      child: Container(
        width: 4,
        height: 4,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
            shape: OvalBorder()),
      ),
    ) : Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: AppColors.backgroundColors[ThemeCubit().currentTheme],
        shape: OvalBorder(
            side: BorderSide(
                width: 1.w,
                color: AppColors.c949D9E
            )
        ),
      ),
    )

    ;
  }
}
