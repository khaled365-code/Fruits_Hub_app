


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class EditAddressContainer extends StatelessWidget {
  const EditAddressContainer({super.key,required this.shippingAddressEntity,
  required this.orderEntity
  });

  final ShippingAddressEntity shippingAddressEntity;
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
        decoration: ShapeDecoration(
          color: AppColors.cF2F3F3.withValues(alpha: .5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
       ),child: Column(
        children:
        [
          InkWell(
            onTap: ()
            {
              if(orderEntity.payWithCash==true)
              {
                Navigator.pop(context);
              }
              else
              {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Row(
              children:
              [
                Text('عنوان التوصيل',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold
                ),),
                const Spacer(),
                SvgPicture.asset(ImageConstants.editIcon),
                const SpaceWidget(width: 4,),
                Text('تعديل',style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.c949D9E,
                ),),
              ],
            ),
          ),
          const SpaceWidget(height: 8,),
          Row(
            children:
            [
              SvgPicture.asset(ImageConstants.locationIcon),
              const SpaceWidget(width: 8,),
              Text('شارع ${shippingAddressEntity.addressDetails}، مبنى رقم ${shippingAddressEntity.floorNum}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.c4E5556,
                  fontSize: 16
              ),),
            ],
          )
       ],
      ));
  }
}
