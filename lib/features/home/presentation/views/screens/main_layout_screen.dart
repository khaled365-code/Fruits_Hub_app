

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/widgets/common_bottom_nav_bar.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/screens/home_screen.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  static List<Widget> appMainScreens=
  [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: BlocBuilder<MainLayoutCubit,MainLayoutState>(
      builder: (context,state) =>appMainScreens[state.currentScreenIndex])

    );
  }
}
