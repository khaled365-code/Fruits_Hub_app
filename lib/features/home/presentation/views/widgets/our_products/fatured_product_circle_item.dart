
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class FeaturedProductCircleItem extends StatelessWidget {
  const FeaturedProductCircleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: ShapeDecoration(
          color: AppColors.foregroundColors[ThemeCubit().currentTheme],
          shape: OvalBorder(),
          ),
          child: Center(child: Image.asset(ImageConstants.avocadoImage)),
        ),
        SpaceWidget(height: 2,),
        Text('data',style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.textColors[ThemeCubit().currentTheme]
        ),)
      ],
    );
  }
}
