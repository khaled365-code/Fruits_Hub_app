


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

import '../../../../../core/global/manager/theme_cubit/theme_cubit.dart';
import '../../../../../core/global/theme/app_colors.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: ShapeDecoration(
        shape: OvalBorder(),
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: SvgPicture.asset(ImageConstants.plusIcon,colorFilter:
        ColorFilter.mode(AppColors.backgroundColors[ThemeCubit().currentTheme],BlendMode.srcIn),),
      ),
    );
  }
}
