


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class FeaturedOffersContainer extends StatelessWidget {
  const FeaturedOffersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342/158,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Stack(
        children:
        [
          Positioned.fill(child: Image.asset(ImageConstants.fruitsOffersImage,fit: BoxFit.fitWidth,)),
          Image.asset(ImageConstants.homeEllipseImage,),
          PositionedDirectional(
            top: 25.h,
            start: 25.w,
            bottom: 29.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text('عروض العيد',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
                ),),
                Spacer(),
                Text('خصم 25%',style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
                ),),
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
      ),));
  }
}
