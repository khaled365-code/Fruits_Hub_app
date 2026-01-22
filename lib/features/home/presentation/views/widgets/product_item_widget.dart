



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

import 'add_product_button.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: BoxDecoration(
          color: AppColors.foregroundColors[ThemeCubit().currentTheme],
          borderRadius: BorderRadius.circular(4.r)
        ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 17.h,start: 8.5.w,end: 8.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Center(child:Image.asset(ImageConstants.fraiseImage)),
                Spacer(),
                Text('فراولة',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textColors[ThemeCubit().currentTheme]
                ),),
                Row(
                  children: [
                    Text('30جنية / الكيلو',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.secondaryColor
                    ),),
                    Spacer(),
                    AddProductButton()
                  ],
                ),
                SpaceWidget(height: 16,)

              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: 8.w,
          top: 8.h,
          child: SvgPicture.asset(ImageConstants.heartIcon),
        ),
      ],
    );
  }
}
