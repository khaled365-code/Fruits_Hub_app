


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class FeaturedOffersContainer extends StatelessWidget {
  const FeaturedOffersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
      ),child: Stack(
        children:
        [
          Positioned.fill(child: Image.asset(ImageConstants.fruitsOffersImage,fit: BoxFit.fitWidth,)),
          Image.asset(ImageConstants.homeEllipseImage,),
          PositionedDirectional(
            top: 33.h,
            start: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text('عروض العيد',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
                ),),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: 8.h),
                  child: Text('خصم 25%',style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
                  ),),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: 7.h),
                  child: TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                          fixedSize: Size(116, 32),
                          backgroundColor: AppColors.backgroundColors[ThemeCubit().currentTheme],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)
                          )
                      ),
                      child: Text('تسوق الان',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color:ThemeCubit().currentTheme==0? AppColors.darkerPrimaryColor:AppColors.primaryColor
                      ),)),
                ),
              ],
            ),
          ),

        ],
      ),);
  }
}
