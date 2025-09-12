import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/core/services/cache_service.dart';
import 'package:meta/meta.dart';



class LocalizationCubit extends Cubit<String> {

  LocalizationCubit._named(): super('ar');
  static final _instance=LocalizationCubit._named();
  factory LocalizationCubit() => _instance;


  String currentLanguage='ar';


  switchLanguage() async
  {
    if(currentLanguage=='ar')
      {
        currentLanguage='en';
        await CacheService().setString(key: AppConstants.appLanguage, value: currentLanguage);
        emit('en');
      }
    else
      {
        currentLanguage='ar';
        await CacheService().setString(key: AppConstants.appLanguage, value: currentLanguage);
        emit('ar');
      }
  }

}
