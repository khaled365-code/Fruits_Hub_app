


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';

class RealAppBarWidget extends StatelessWidget {
  const RealAppBarWidget({super.key,required this.title,this.canBack=true,this.onAppBarBtnPressed});

  final String title;
  final bool canBack;
  final void Function()? onAppBarBtnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        GestureDetector(
          onTap: onAppBarBtnPressed ?? ()
          {
           canBack? Navigator.pop(context):null;
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
            color: AppColors.textColors[ThemeCubit().currentTheme]
        ),),
        Spacer(flex: 2,),
      ],

    );
  }
}
