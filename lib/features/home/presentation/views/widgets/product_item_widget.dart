



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/cart_bloc/cart_bloc.dart';

import 'add_product_button.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key,this.productEntity});


  final ProductEntity? productEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: BoxDecoration(
          color: AppColors.foregroundColors[ThemeCubit().currentTheme],
          borderRadius: BorderRadius.circular(4.r)
        ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 17.h,start: 8.5.w,end: 8.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                productEntity?.imageUrl==null?
                Container(
                 color: Colors.grey,
                 height: 99,
                 width: 131
                ) :
                Center(child:Image.network(productEntity!.imageUrl,height: 99,width: 131,)),
                Spacer(),
                Text(productEntity?.name??"strawberry".tr(context),style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textColors[ThemeCubit().currentTheme]
                ),),
                Row(
                  children: [
                    Text('${productEntity?.price ?? 100} ${'pound'.tr(context)} / ',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.secondaryColor
                    ),),
                    Text('kilo'.tr(context),style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.lightSecondaryColor
                    ),),
                    Spacer(),
                    AddProductButton(
                      onAddProductPressed: ()
                      {
                        productEntity!=null?
                        context.read<CartBloc>().add(AddCartItemEvent(productEntity: productEntity!)):null;
                        
                      },
                    ),
                  ],
                ),
                SpaceWidget(height: 16,)

              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: 8.w,
          top: 8.h,
          child: SvgPicture.asset(ImageConstants.heartIcon),
        ),
      ],
    );
  }
}
