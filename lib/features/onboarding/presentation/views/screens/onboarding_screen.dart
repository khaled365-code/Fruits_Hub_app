


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/widgets/page_view_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const PageViewBody(),
      ),
    );
  }
}
