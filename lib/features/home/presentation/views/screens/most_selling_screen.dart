

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/product_item_widget.dart';

import '../../../../../core/widgets/common_bottom_nav_bar.dart';

class MostSellingScreen extends StatelessWidget {
  const MostSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers:
          [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  CommonAppBar(title: 'الأكثر مبيعًا'),
                  const SpaceWidget(height: 24,),
                  Text('الأكثر مبيعًا',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textColors[ThemeCubit().currentTheme]),),
                  const SpaceWidget(height: 12,),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItemWidget(),
              childCount: 12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                  childAspectRatio: 163/214
                ),
            ),
            SliverToBoxAdapter(child: SpaceWidget(height: 15,),)



          ],
        ),
      ),
    );
  }
}
