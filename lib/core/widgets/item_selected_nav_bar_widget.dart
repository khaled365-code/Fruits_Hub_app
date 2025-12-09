

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../global/manager/theme_cubit/theme_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_assets.dart';
import 'just_circulat_container_nav_bar.dart';
import 'space_widget.dart';

class ItemSelectedNavBarWidget extends StatelessWidget {
  const ItemSelectedNavBarWidget({
    super.key, required this.text, required this.iconName,
  });

  final String text,iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: ThemeCubit().currentTheme==0? AppColors.c1E1E1E:AppColors.cEEEEEE,
      ),
      child: Row(
        children:
        [
          SpaceWidget(width: 3,),
          CircularNavBarContainer(child: SvgPicture.asset(iconName,
            colorFilter:ColorFilter.mode(ThemeCubit().currentTheme==0? AppColors.c0D0D0D:Colors.white, BlendMode.srcIn))),
          SpaceWidget(width: 4,),
          Text(text,style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ThemeCubit().currentTheme==0? AppColors.darkerPrimaryColor:AppColors.primaryColor
          ),),
          SpaceWidget(width: 7,),
        ],
      ),
    );
  }
}