


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_assets.dart';
import 'item_selected_nav_bar_widget.dart';

class UserIconNavBar extends StatefulWidget {
  const UserIconNavBar({super.key});

  @override
  State<UserIconNavBar> createState() => _UserIconNavBarState();
}

class _UserIconNavBarState extends State<UserIconNavBar> {

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
          iconName: ImageConstants.userIcon,
          text: 'حسابي',
        ): SvgPicture.asset(ImageConstants.userIcon))
    ;
  }
}
