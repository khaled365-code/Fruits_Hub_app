


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class OrWithDividersRow extends StatelessWidget {
  const OrWithDividersRow({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Expanded(
          child: Divider(
            thickness: 3,
            color: AppColors.cf2f3f3,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 19.w),
          child: Text('أو',style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textColors[ThemeCubit().currentTheme]
          ),),
        ),
        Expanded(
          child: Divider(
            thickness: 3,
            color: AppColors.cf2f3f3,
          ),
        ),
      ],
    );
  }
}

