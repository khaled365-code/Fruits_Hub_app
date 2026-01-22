



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'nav_bar_item_widget.dart';

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
            color: Colors.black.withValues(alpha: .1),
            spreadRadius:0
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r)
        )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26.w,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index)=>
          NavBarItemWidget(mainLayoutCubit: context.read<MainLayoutCubit>(), index: index))
        ),
      ),
    );
  }
}




