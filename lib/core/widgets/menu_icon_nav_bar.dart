

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import 'item_selected_nav_bar_widget.dart';

class MenuIconNavBar extends StatefulWidget {
  const MenuIconNavBar({super.key});

  @override
  State<MenuIconNavBar> createState() => _MenuIconNavBarState();
}

class _MenuIconNavBarState extends State<MenuIconNavBar> {

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
          iconName: ImageConstants.menuIcon,
          text: 'المنتجات',
        ): SvgPicture.asset(ImageConstants.menuIcon));
  }
}
