


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import 'item_selected_nav_bar_widget.dart';

class HomeIconNavBar extends StatefulWidget {
  const HomeIconNavBar({
    super.key,
  });



  @override
  State<HomeIconNavBar> createState() => _HomeIconNavBarState();
}

class _HomeIconNavBarState extends State<HomeIconNavBar> {


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
          iconName: ImageConstants.homeIcon,
          text: 'الرئيسية',
        ): SvgPicture.asset(ImageConstants.homeIcon));
  }
}