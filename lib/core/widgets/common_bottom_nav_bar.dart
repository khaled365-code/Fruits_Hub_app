



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'home_icon_nav_bar.dart';
import 'menu_icon_nav_bar.dart';
import 'small_cart_icon_nav_bar.dart';
import 'user_icon_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.backgroundColors[ThemeCubit().currentTheme],
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-2),
            blurRadius: 7,
            color: Colors.black.withValues(alpha: .1)
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r)
        )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [

            HomeIconNavBar(),
            MenuIconNavBar(),
            SmallCartIconNavBar(),
            UserIconNavBar(),


          ],
        ),
      ),
    );
  }
}




