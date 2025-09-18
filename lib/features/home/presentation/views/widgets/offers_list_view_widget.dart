


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/widgets/home_offers_container.dart';

class OffersListViewWidget extends StatelessWidget {
  const OffersListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      child: ListView.separated(
        itemBuilder: (context,index)=>HomeOffersContainer(),
        separatorBuilder: (context, index) => SpaceWidget(width: 8,),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
