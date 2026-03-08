

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/constants/enums.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/product_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingProductsBlocBuilder extends StatelessWidget {
  const BestSellingProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit,MainLayoutState>(
      buildWhen: (prev,current)=>
      prev.getBestSellingProductsRequestState!=current.getBestSellingProductsRequestState,
      builder: (context, state) {
        if(state.getBestSellingProductsRequestState==RequestStates.success &&
            state.bestSellingProductsList?.isNotEmpty==true
        )
        {
          return SliverGrid.builder(
            itemCount: state.bestSellingProductsList!.length,
            itemBuilder: (context, index) => ProductItemWidget(
              productEntity: state.bestSellingProductsList![index],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 163 / 214,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
            ),
          );
        }
        else if (state.getBestSellingProductsRequestState==RequestStates.success &&
            state.bestSellingProductsList?.isEmpty==true)
        {
          return SliverToBoxAdapter(child: Text('Empty data'));
        }
        else if (state.getBestSellingProductsRequestState==RequestStates.error)
        {
          return SliverToBoxAdapter(child: Text(state.fetchAllProductsErrorM));
        }
        else
        {
          return Skeletonizer.sliver(
            child: SliverGrid.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ProductItemWidget(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 214,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8,
              ),
            ),
          );

        }

      },
    );
  }
}
