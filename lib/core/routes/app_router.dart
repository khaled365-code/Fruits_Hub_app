import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/routes/routes.dart';
import 'package:fruits_commerce_app/core/services/service_locator.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:fruits_commerce_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/forget_password_screen.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/otp_screen.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/reset_password_screen.dart';
import 'package:fruits_commerce_app/features/auth/presentation/views/screens/signup_screen.dart';
import 'package:fruits_commerce_app/features/home/presentation/manager/main_layout_cubit/main_layout_cubit.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/screens/main_layout_screen.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:fruits_commerce_app/features/splash/presentation/views/screens/splash_screen.dart';

import '../../features/home/presentation/views/screens/most_selling_screen.dart';

class AppRouter {

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _buildScreen(widget: SplashScreen());
      case Routes.onBoardingScreen:
        return _buildScreen(widget: OnBoardingScreen());
      case Routes.loginScreen:
        return _buildScreen(widget: BlocProvider(
            create: (context) => locator<LoginBloc>(),
            child: LoginScreen()));
      case Routes.signUpScreen:
        return _buildScreen(widget: BlocProvider(
          create: (context) => locator<SignupCubit>(),
          child: SignUpScreen(),
        ));
      case Routes.forgetPassScreen:
        return _buildScreen(widget: ForgetPasswordScreen());

      case Routes.resetPasswordScreen:
        return _buildScreen(widget: ResetPasswordScreen());

      case Routes.otpScreen:
        return _buildScreen(widget: OtpScreen());

      case Routes.mainLayoutScreen:
        return _buildScreen(widget: MainLayoutScreen());

      case Routes.mostSellingScreen:
        return _buildScreen(widget: MostSellingScreen());

      default:
        return _buildDefaultRoute();
    }
  }


  static MaterialPageRoute _buildScreen(
      {required Widget widget, RouteSettings? settings}) =>
      MaterialPageRoute(builder: (_) => widget, settings: settings);


  static MaterialPageRoute _buildDefaultRoute() =>
      MaterialPageRoute(builder: (_) =>
          Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('No Route Found'),
              ),
            ),
          ),
      );

}



