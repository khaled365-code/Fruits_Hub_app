


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/common_app_bar.dart';
import 'package:fruits_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/cart_bloc/cart_bloc.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/cart/cart_products_list.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/cart/items_in_cart_count.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:
      [
        SliverToBoxAdapter(
          child: Column(
            children:
            [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: CommonAppBar(title: 'cart'.tr(context),hasNotification: false,),
              ),
              const SpaceWidget(height: 16,),
              ItemsInCartCount(),
              const SpaceWidget(height: 24,),
            ],
          ),
        ),
        SliverToBoxAdapter(child: Divider(height: 1,
          thickness: 1,
          color: AppColors.cF1F1F5,
        )),
        BlocBuilder<CartBloc,CartState>(
          builder: (context,state)
          {
             if (context.read<CartBloc>().carts.cartsList!=[])
               {
                 return CartProductsList(cartsList: context.read<CartBloc>().carts.cartsList,);
               }
             else
               {
                 return SizedBox.shrink();
               }
          },
        ),
        SliverToBoxAdapter(child: Divider(height: 1,
          thickness: 1,
          color: AppColors.cF1F1F5,
        )),
        PayForCartsBtn(),







      ],
    );
  }
}
class PayForCartsBtn extends StatelessWidget {
  const PayForCartsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 67),
          child: SharedButton(btnText: '  ${'checkout'.tr(context)} ${context.watch<CartBloc>().carts.calculateAllCartsPrice()} ${'pound'.tr(context)}',
              onPressedBtn: (){}),
        ),
      ),
    );
  }
}

