

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class ActiveProgressBarItem extends StatelessWidget {
  const ActiveProgressBarItem({super.key,required this.itemName});


  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
          Container(
            width: 23,
            height: 23,
            decoration: ShapeDecoration(shape: OvalBorder(),
            color: AppColors.primaryColor
            ),
            child: Center(child: SvgPicture.asset(ImageConstants.checkIcon)),
          ),
        const SpaceWidget(width: 4,),
        Text(itemName,style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700
        ),)

      ],
    );
  }
}
