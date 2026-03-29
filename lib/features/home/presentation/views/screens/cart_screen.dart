


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/common_functions.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';
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

        CommonAppBar(title: 'cart'.tr(context),hasNotification: false,),
        SliverToBoxAdapter(
          child: Column(
            children:
            [

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
        PayForCartsBtn(cartBloc: context.watch<CartBloc>(),),







      ],
    );
  }
}
class PayForCartsBtn extends StatelessWidget {
  const PayForCartsBtn({super.key,required this.cartBloc});

  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 67),
          child: SharedButton(
              btnText: '  ${'checkout'.tr(context)} ${cartBloc.carts.calculateAllCartsPrice()} ${'pound'.tr(context)}',
              onPressedBtn: ()
              {
                  navigate(route: Routes.chargingScreen, context: context,args: cartBloc.carts);
                  LoggerService().logDebug('Total cart price : ${cartBloc.carts.calculateAllCartsPrice()}');
              }),
        ),
      ),
    );
  }
}

