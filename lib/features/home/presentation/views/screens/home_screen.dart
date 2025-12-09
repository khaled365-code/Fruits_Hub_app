


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/main_home_app_bar.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/most_sold_row.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/search_text_field_widget.dart';
import '../../../../../core/widgets/common_bottom_nav_bar.dart';
import '../widgets/offers_list_view_widget.dart';
import '../widgets/product_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                children:
                [
                  MainHomeAppBar(),
                  SpaceWidget(height: 16,),
                  SearchTextFieldWidget(),
                  SpaceWidget(height: 12,),
                  OffersListViewWidget(),
                  SpaceWidget(height: 12,),
                  MostSoldRow(),
                  SpaceWidget(height: 12.5,),

                ]
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) => ProductItemWidget(),
                childCount: 8,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 214,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8,
              ),
            ),
            SliverToBoxAdapter(child: SpaceWidget(height: 15,),)
          ],
        ),
      ),
    );
  }
}
