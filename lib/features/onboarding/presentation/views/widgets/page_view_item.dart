

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key,required this.currentPageIndex});

  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Stack(
            children:
            [
              currentPageIndex==0?
              Align(
                alignment: AlignmentDirectional.topCenter,
                  child: SvgPicture.asset(
                      width: MediaQuery.sizeOf(context).width,
                      ImageConstants.onBoardFirstBackIcon)):
              Align(
                alignment: AlignmentDirectional.topCenter,
                  child: SvgPicture.asset(
                    width: MediaQuery.sizeOf(context).width,
                      ImageConstants.onBoardSecBackIcon)),

              currentPageIndex==0?
              PositionedDirectional(
                  top: 182.h,
                  start: 62.w,
                  end: 62.w,
                  child: SvgPicture.asset(ImageConstants.fruitsDishIcon),):
              PositionedDirectional(
                top: 173.h,
                start: 75.w,
                end: 75.w,
                child: SvgPicture.asset(ImageConstants.anasIcon),),

              currentPageIndex==0?
              PositionedDirectional(
                start: 20.w,
                top: 39.h,
                child: GestureDetector(
                  onTap:() async
                  {
                    navigate(route: Routes.loginScreen,context: context,replaced: true);
                    await CacheService().setBool(key:AppConstants.onBoardIsOpened,value: true);

                  },
                  child: Text('skip'.tr(context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.c949D9E
                  ),),
                ),):
              SizedBox.shrink(),

            ],
          ),
          SpaceWidget(height: 64,),
          currentPageIndex==0?
          Column(
            children:
            [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'welcomeTitle'.tr(context),style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.textColors[ThemeCubit().currentTheme]
                    )),
                    TextSpan(text: ' ',style: Theme.of(context).textTheme.displaySmall),
                    TextSpan(text: 'Fruit',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.secondaryColor
                    )),
                    TextSpan(text: 'HUB',style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.primaryColor
                    ),),
                  ]
              ),),

              SpaceWidget(height: 24,),

              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 37.w),
                child: Text(
                  textAlign: TextAlign.center,
                  'discoverExperience'.tr(context),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.c4E5556
                  ),),
              )
            ],
          ):
          Column(
            children:
            [
              Text('searchAndShop'.tr(context),style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme]
              ),),
              SpaceWidget(height: 24,),
              Padding(
                padding:  EdgeInsetsDirectional.symmetric(horizontal: 40.w),
                child: Text('bestFruitsDescription'.tr(context),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.c4E5556
                ), textAlign: TextAlign.center,),
              )


            ]
          )
        ],
      ),
    );
  }
}
