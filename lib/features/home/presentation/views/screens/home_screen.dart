import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/best_selling_products_bloc_builder.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/main_home_app_bar.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/most_sold_row.dart';
import 'package:fruits_commerce_app/core/widgets/search_text_field_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widgets/offers_list_view_widget.dart';
import '../widgets/product_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()
      {
        return context.read<MainLayoutCubit>().getBestSellingProducts();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
            BestSellingProductsBlocBuilder(),
            SliverToBoxAdapter(child: SpaceWidget(height: 15,),),
          ],
        ),
      ),
    );
  }
}
