



import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/routes/app_router.dart';

import 'core/global/theme/theme_data/app_light_theme.dart';

class FruitsShopApp extends StatelessWidget {
  const FruitsShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: const
        [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalization.supportedLocales,
        localeResolutionCallback: (deviceLocale, supportedLocales)
        {
          for (var locale in supportedLocales) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.getAppLightTheme(),
        title: 'Fruits Hub',
        onGenerateRoute: AppRouter.onGenerateRoutes,
      ),
    );
  }
}
