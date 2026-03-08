

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class OurProductsFilterRow extends StatelessWidget {
  const OurProductsFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
         Text('ourProducts'.tr(context),style: Theme.of(context).textTheme.headlineSmall?.copyWith(
           color: AppColors.textColors[ThemeCubit().currentTheme]
         ),),
        Spacer(),
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 5.5),
          decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4.r),
           side: BorderSide(
             width: 1,
             color: AppColors.cCACECE.withValues(alpha: .4)
           )
          )),
          child: SvgPicture.asset(ImageConstants.filterVerticalIcon),
        )
      ],
    );
  }
}
