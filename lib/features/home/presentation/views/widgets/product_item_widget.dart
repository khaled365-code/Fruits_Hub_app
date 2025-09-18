



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

import 'add_product_button.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 163/214,
      child: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            color: AppColors.foregroundColors[ThemeCubit().currentTheme],
            borderRadius: BorderRadius.circular(4.r)
          ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w,top: 8.h),
            child: SvgPicture.asset(ImageConstants.heartIcon),
          ),
          PositionedDirectional(
            top: 17,
            start: 16.5,
            end: 16.5,
            child: Image.asset(ImageConstants.fraiseImage),
          ),
          PositionedDirectional(
            top: 146,
            start: 7.5,
            child: Text('فراولة',style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.textColors[ThemeCubit().currentTheme]
            ),),
          ),
          PositionedDirectional(
            top: 173,
            start: 7.5,
            child: Row(
              children: [
                Text('30جنية / الكيلو',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.secondaryColor
                ),),
               SpaceWidget(width: 23,),
               AddProductButton()
              ],
            ),
          ),

        ],
      ),
    );
  }
}
