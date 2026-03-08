


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

import '../../../../../core/global/manager/theme_cubit/theme_cubit.dart';
import '../../../../../core/utils/app_colors.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key,required this.onAddProductPressed});

  final VoidCallback onAddProductPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddProductPressed,
      child: Container(
       padding: EdgeInsetsDirectional.all(10),
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: ThemeCubit().currentTheme==0?AppColors.primaryColor:AppColors.darkerPrimaryColor,
        ),
        child: Center(
          child: SvgPicture.asset(ImageConstants.plusIcon,colorFilter:
          ColorFilter.mode(AppColors.backgroundColors[ThemeCubit().currentTheme],BlendMode.srcIn),),
        ),
      ),
    );
  }
}
