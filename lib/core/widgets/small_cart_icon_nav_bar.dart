

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import 'item_selected_nav_bar_widget.dart';

class SmallCartIconNavBar extends StatefulWidget {
  const SmallCartIconNavBar({super.key});

  @override
  State<SmallCartIconNavBar> createState() => _SmallCartIconNavBarState();
}

class _SmallCartIconNavBarState extends State<SmallCartIconNavBar> {

  bool itemIsSelected=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()
        {
          setState(() {
            itemIsSelected=!itemIsSelected;
          });
        },
        child: itemIsSelected?
        ItemSelectedNavBarWidget(
          iconName: ImageConstants.smallCartIcon,
          text: 'سلة التسوق',
        ): SvgPicture.asset(ImageConstants.smallCartIcon));
  }
}
