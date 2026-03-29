


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
          _isChecked=!_isChecked;
          setState(() {

          });
      },
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: ShapeDecoration(
            color: _isChecked ? AppColors.primaryColor : AppColors
                .backgroundColors[ThemeCubit().currentTheme],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: _isChecked== false ? BorderSide(
                    color: AppColors.cDDDFDF,
                    width: 1.5.w
                ) : BorderSide.none
            )
        ),
        child: _isChecked == true
            ? Center(child: SvgPicture.asset(ImageConstants.checkTrueIcon))
            : SizedBox.shrink(),
      ),
    );
  }
}
