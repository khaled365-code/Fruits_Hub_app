


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(),
      body: CustomScrollView(
        slivers: 
        [

        ],
      ),
    );
  }
}
