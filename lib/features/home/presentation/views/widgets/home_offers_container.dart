


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class HomeOffersContainer extends StatelessWidget {
  const HomeOffersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342/158,
      child: Stack(
        children:
        [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              children:
              [
                SvgPicture.asset(ImageConstants.homeOfferEllipseIcon),
                Expanded(child: Image.asset(ImageConstants.fruitsOffersImage,fit: BoxFit.fitHeight,)),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 20.w,top: 20.h),
            child: Text('عروض العيد',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
            ),),
          ),
          PositionedDirectional(
            top: 58,
            start: 20,
            child: Text('خصم 25%',style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textColors[ThemeCubit().currentTheme==0?1:0]
            ),),
          ),
          PositionedDirectional(
            top: 90,
            start: 20,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 30,),
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

          ),

        ],
      ),);
  }
}
