

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/notification_icon_container.dart';

class MainHomeAppBar extends StatelessWidget {
  const MainHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.zero,
      leading: Container(
        width: 44.w,
        height: 44.h,
        decoration: ShapeDecoration(
            color: AppColors.c5DB957,
            shape: OvalBorder()),
        child: Center(child: Image.asset(ImageConstants.manProfileImage)),
      ),

      title: Text('صباح الخير !..',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.c949D9E
      ),),
      subtitle: Text('أحمد مصطفي',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: AppColors.textColors[ThemeCubit().currentTheme]
      ),),
      trailing: NotificationIconContainer(),
    );
  }
}


