import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';


class ThemeCubit extends Cubit<int> {

  ThemeCubit._named() : super(1);
  static ThemeCubit? _instance ;
  factory ThemeCubit() => _instance??=ThemeCubit._named();

  // lazy singleton construction



  int currentTheme=1;


  switchTheme() async
  {
     if (currentTheme==1)
       {
         currentTheme=0;
         await CacheService().setInt(key: AppConstants.currentAppTheme, value: currentTheme);
         emit(0);
       }
     else
       {
         currentTheme=1;
         await CacheService().setInt(key: AppConstants.currentAppTheme, value: currentTheme);
         emit(1);
       }


  }

}
