import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/routes/app_router.dart';
import 'package:fruits_commerce_app/core/service_locator/service_locator.dart';

import 'core/global/theme/theme_data/app_light_theme.dart';

class FruitsShopApp extends StatelessWidget {
  const FruitsShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocProvider(
        create: (context) => locator<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit,int>(
          builder: (context, state) {
            return MaterialApp(
              locale: Locale('ar'),
              localizationsDelegates: const
              [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalization.supportedLocales,
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              theme: AppLightTheme.getAppLightTheme(themeValue: state),
              title: 'Fruits Hub',
              onGenerateRoute: AppRouter.onGenerateRoutes,
            );
          },
        ),
      ),
    );
  }
}
