


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/notification_icon_container.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key,this.hasNotification=true,required this.title,this.hasBackBtn=true,
  this.activatePadding=true
  });


  final bool hasNotification;
  final bool hasBackBtn;
  final String title;
  final bool activatePadding;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      leading: hasBackBtn?
      Padding(
        padding: activatePadding==true? EdgeInsetsDirectional.only(start: 16.w) : EdgeInsets.zero,
        child: InkWell(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: ShapeDecoration(
              color: AppColors.backgroundColors[ThemeCubit().currentTheme],
              shape: OvalBorder(
                  side: BorderSide(
                      color: AppColors.cF1F1F5,
                      width: 1.w
                  )
              ),
            ),
            child: Center(
              child: LocalizationCubit().currentLanguage=='en'?
              Transform.rotate(angle: 3.1415926536,child: SvgPicture.asset(ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(
                  ThemeCubit().currentTheme==0?AppColors.c0C0D0D : AppColors.white,
                  BlendMode.srcIn),),):
              SvgPicture.asset(ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(
                  ThemeCubit().currentTheme==0?AppColors.c0C0D0D : AppColors.white,
                  BlendMode.srcIn),),
            ),
          ),
        ),
      ):SizedBox.shrink(),
      title:  Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: AppColors.textColors[ThemeCubit().currentTheme]
      ),),
      actions:
      [
        hasNotification==true?
        Padding(
          padding: activatePadding==true? EdgeInsetsDirectional.only(end: 16.w) : EdgeInsets.zero,
          child: NotificationIconContainer(),
        ):SizedBox.shrink()
      ],
      centerTitle: true,
    );
  }
}
