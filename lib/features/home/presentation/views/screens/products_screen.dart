

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/search_text_field_widget.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/best_selling_products_bloc_builder.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/most_sold_row.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/our_products/featured_products_hori_list.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/our_products/our_products_filter_row.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()
      {
        return context.read<MainLayoutCubit>().getBestSellingProducts();
      },
      child: CustomScrollView(
        slivers:
        [
          CommonAppBar(title: 'products'.tr(context),hasBackBtn: false,),
          SliverToBoxAdapter(
             child: Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
               child: Column(
                 children:
                 [
                   const SpaceWidget(height: 16,),
                   SearchTextFieldWidget(),
                   const SpaceWidget(height: 16,),
                   OurProductsFilterRow(),
                   const SpaceWidget(height: 8,),

                 ],
               ),
             ),
           ),
           SliverToBoxAdapter(
             child: FeaturedProductsHoriList(),
           ),
           SliverToBoxAdapter(
             child: Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
               child: Column(
                 children:
                 [
                    const SpaceWidget(height: 24,),
                    MostSoldRow(),
                    SpaceWidget(height: 8,),


                 ],
               ),
             ),
           ),
           BestSellingProductsBlocBuilder(),
           SliverToBoxAdapter(child: const SpaceWidget(height: 15,)),

        ],
      ),
    );
  }
}
