


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/featured_offers_container.dart';

class OffersListViewWidget extends StatelessWidget {
  const OffersListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342/158,
      child: ListView.separated(
        padding: EdgeInsetsDirectional.zero,
        itemBuilder: (context,index)=>FeaturedOffersContainer(),
        separatorBuilder: (context, index) => SpaceWidget(width: 8,),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
