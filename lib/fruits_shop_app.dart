import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/global/manager/theme_cubit/theme_cubit.dart';
import 'package:fruits_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_commerce_app/core/routes/app_router.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';

import 'core/global/theme/theme_data/app_theme.dart';

class FruitsShopApp extends StatelessWidget {
  const FruitsShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => LocalizationCubit(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, String>(
        builder: (context, localState) {
          return BlocBuilder<ThemeCubit, int>(
            builder: (context, state) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                child: MaterialApp(
                      locale: Locale(CacheService().getString(key: AppConstants.appLanguage) ?? localState),
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
                          if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
                            return deviceLocale;
                          }
                        }
                        return supportedLocales.first;
                      },
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.getAppTheme(themeValue: CacheService().getInt(key: AppConstants.currentAppTheme)??state ),
                      title: 'Fruits Hub',
                      onGenerateRoute: AppRouter.onGenerateRoutes,
                    ),
              );
            },
          );
        },
      ),
    );
  }

}


/*





 */
