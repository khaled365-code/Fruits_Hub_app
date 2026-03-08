

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class PlusOrMinusIcon extends StatelessWidget {
  const PlusOrMinusIcon({super.key,required this.plusIcon,required this.onBtnPressed});
  
  final bool plusIcon;
  final VoidCallback onBtnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: plusIcon? AppColors.primaryColor : AppColors.cF1F1F5,
            shape: OvalBorder(),
        ),
        child: plusIcon ? Center(child: SvgPicture.asset(ImageConstants.plusIcon,width: 10,height: 10,)) :
        Center(
          child: Container(
            width: 8,
            height: 1,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
              color: AppColors.c979899
            ),
          ),
        ),
      ),
    );
  }
}
