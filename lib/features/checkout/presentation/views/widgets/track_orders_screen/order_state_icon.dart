

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';

class OrderStateIcon extends StatelessWidget {
  const OrderStateIcon({super.key,required this.orderStateIcon});

  final String orderStateIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      decoration: ShapeDecoration(
        color: AppColors.cEBF9F1,
        shape: OvalBorder()
      ),
      child: Center(child: SvgPicture.asset(orderStateIcon)),
    );
  }
}
