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
import 'package:fruits_commerce_app/features/checkout/presentation/manager/place_order_bloc.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/address_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/charging_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/payment_options_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/payment_revision_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/success_payment_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/screens/track_order_screen.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/charging_screen/payment_options_section.dart';
import 'package:fruits_commerce_app/features/home/presentation/views/screens/main_layout_screen.dart';
import 'package:fruits_commerce_app/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:fruits_commerce_app/features/splash/presentation/views/screens/splash_screen.dart';
import '../../features/home/presentation/manager/cart_bloc/cart_bloc.dart';
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

      case Routes.chargingScreen:
        return _buildScreen(widget: ChargingScreen(), settings: settings);

      case Routes.addressScreen:
        return _buildScreen(widget: AddressScreen(), settings: settings);

      case Routes.paymentOptionsScreen:
        return _buildScreen(widget: PaymentOptionsScreen(), settings: settings);

      case Routes.paymentRevisionScreen:
        return _buildScreen(widget: BlocProvider(
          create: (context) => locator<PlaceOrderBloc>(),
          child: PaymentRevisionScreen(),
        ), settings: settings);

      case Routes.successPaymentScreen:
        return _buildScreen(widget: SuccessPaymentScreen());

      case Routes.trackOrderScreen:
        return _buildScreen(widget: TrackOrderScreen());

      case Routes.resetPasswordScreen:
        return _buildScreen(widget: ResetPasswordScreen());

      case Routes.otpScreen:
        return _buildScreen(widget: OtpScreen());

      case Routes.mainLayoutScreen:
        return _buildScreen(widget: BlocProvider(
          create: (_) => CartBloc(),
          child: MainLayoutScreen(),
        ),);

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



