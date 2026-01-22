


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

import '../utils/app_assets.dart';

class NotificationIconContainer extends StatelessWidget {
  const NotificationIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 34.h,
      decoration: ShapeDecoration(
          color: AppColors.cEEF8ED,
          shape: OvalBorder()),
      child: Center(child: SvgPicture.asset(ImageConstants.notificationIcon)),
    );
  }
}