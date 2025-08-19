


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class RealAppBarWidget extends StatelessWidget {
  const RealAppBarWidget({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                  side: BorderSide(
                      color: AppColors.cF1F1F5,
                      width: 1.w
                  )
              ),
            ),
            child: Center(child: SvgPicture.asset(ImageConstants.arrowBackIcon)),
          ),
        ),
        Spacer(),
        Text(
          title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.textColors[locator<ThemeCubit>().currentTheme]
        ),),
        Spacer(flex: 2,),
      ],

    );
  }
}
