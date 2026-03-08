

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/our_products/fatured_product_circle_item.dart';

class FeaturedProductsHoriList extends StatelessWidget {
  const FeaturedProductsHoriList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index)=> Padding(
            padding: EdgeInsetsDirectional.only(end: 9.w),
            child: FeaturedProductCircleItem()))
      ),
    );
  }
}
