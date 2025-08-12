


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({super.key,this.width,this.height});

  final double? width,height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
    );
  }
}
