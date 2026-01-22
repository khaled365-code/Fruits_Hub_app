
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeCubit().currentTheme==0?
        Colors.white: AppColors.inputDecorationColors[1],
        boxShadow:
        [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            offset: Offset(0,2),
            spreadRadius: 0,
            blurRadius: 9
          )
        ]
      ),
      child: TextFormField(
        decoration: InputDecoration(
         filled: true,
         fillColor: Colors.transparent,
         prefixIcon: SizedBox(
             width: 20,
             child: Center(child: SvgPicture.asset(ImageConstants.searchIcon))),
         hintText: 'ابحث عن.......',
         hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
           color: AppColors.c949D9E
         ),
         suffixIcon: SizedBox(
             width: 20,
             child: Center(child: SvgPicture.asset(ImageConstants.searchListIcon))),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none
        ),
      ),
    );

  }

}
