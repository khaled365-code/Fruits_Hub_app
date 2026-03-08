



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CircularNavBarContainer extends StatelessWidget {
  const CircularNavBarContainer({super.key,required this.child});
 
  
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(7.w),
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
          shape: OvalBorder()),
      child: Center(child: child),
    );
  }
}
