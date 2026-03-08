

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/cart_bloc/cart_bloc.dart';

class ItemsInCartCount extends StatelessWidget {
  const ItemsInCartCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cEBF9F1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Text('${'youHave'.tr(context)} ${context.watch<CartBloc>().carts.cartsList.length} ${'productsInCart'.tr(context)}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryColor
          ))
        ],
      ),
    );
  }
}
