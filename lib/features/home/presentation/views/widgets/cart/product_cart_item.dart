
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/cart_bloc/cart_bloc.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/cart/plus_or_minus_icon.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key,required this.cartItemEntity});

  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.5),
      width: double.infinity,
      child: Row(
        children:
        [
          Container(
            color: AppColors.foregroundColors[ThemeCubit().currentTheme],
            padding: EdgeInsetsDirectional.symmetric(vertical: 26,horizontal: 10),
            child: Image.network(cartItemEntity.productEntity.imageUrl,
             width: 53,height: 40,
            ),
          ),
          const SpaceWidget(width: 17,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                ListTile(
                  title:  Text(cartItemEntity.productEntity.name,style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.textColors[ThemeCubit().currentTheme]
                  ),),

                  subtitle: Text('${cartItemEntity.itemCount} ${'kilo'.tr(context)} ',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor
                  ),),
                  trailing: GestureDetector(
                    onTap: ()
                      {
                        context.read<CartBloc>().add(RemoveCartItemEvent(cartItemEntity: cartItemEntity));
                      },
                      child: SvgPicture.asset(ImageConstants.smallTrashIcon)),
                  contentPadding: EdgeInsets.zero,
                ),
                const SpaceWidget(height: 6,),
                Row(
                  children:
                  [
                    PlusOrMinusIcon(plusIcon: true,
                    onBtnPressed: ()
                    {
                      context.read<CartBloc>().add(IncreaseItemCountEvent(cartItemEntity: cartItemEntity));
                    },
                    ),
                    Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Text(cartItemEntity.itemCount.toString(),style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.textColors[ThemeCubit().currentTheme]
                    ),),),
                    PlusOrMinusIcon(plusIcon: false,
                    onBtnPressed: ()
                    {
                      context.read<CartBloc>().add(DecreaseItemCountEvent(cartItemEntity: cartItemEntity));
                    },
                    ),
                    Spacer(),
                    Text('${cartItemEntity.calculateTotalPrice()} ${'pound'.tr(context)} ',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.secondaryColor
                    ),)

                  ],
                ),
                const SpaceWidget(height: 10,)



              ],
            ),
          )
        ],
      ),
    );
  }
}
