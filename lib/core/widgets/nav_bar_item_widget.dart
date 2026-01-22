import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/nav_bar_data_entity.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';

import '../utils/app_assets.dart';
import 'item_selected_nav_bar_widget.dart';

class NavBarItemWidget extends StatelessWidget {
  const NavBarItemWidget({super.key, required this.mainLayoutCubit,required this.index});

  final MainLayoutCubit mainLayoutCubit;
  final int index;

  static const List<NavBarDataEntity> navBarDataList=
  [
    NavBarDataEntity(navBarIcon: ImageConstants.activeHomeIcon, navBarTitle: 'الرئيسية'),
    NavBarDataEntity(navBarIcon: ImageConstants.activeMenuIcon, navBarTitle: 'المنتجات'),
    NavBarDataEntity(navBarIcon: ImageConstants.activeCartIcon, navBarTitle: 'سلة التسوق'),
    NavBarDataEntity(navBarIcon: ImageConstants.activeUserIcon, navBarTitle: 'حسابي')

  ];

  static const List<String> inActiveIconsList=
  [
    ImageConstants.homeIcon,
    ImageConstants.menuIcon,
    ImageConstants.smallCartIcon,
    ImageConstants.userIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit,MainLayoutState>(
      builder: (context, state) {
        return GestureDetector(
            onTap: ()
            {
              mainLayoutCubit.changeCurrentScreenIndex(newScreenIndex: index);
            },
            child: state.currentScreenIndex == index ?
            ItemSelectedNavBarWidget(
              navBarDataEntity: navBarDataList[index]
            ) : SizedBox(
              width: 20,
                child: SvgPicture.asset(inActiveIconsList[index])));
      },
    );
  }
}
