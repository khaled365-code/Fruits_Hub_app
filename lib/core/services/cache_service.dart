
import 'package:shared_preferences/shared_preferences.dart';

class CacheService
{
  CacheService._named();
  static CacheService? _instance;
  factory CacheService() => _instance ??= CacheService._named(); // lazy singleton construction

  late SharedPreferences _sharedPreferences;

  Future<void> init() async
  {
    _sharedPreferences= await SharedPreferences.getInstance();
  }


  Future<void> setBool({required String key,required bool value}) async
  {
    await _sharedPreferences.setBool(key, value);
  }

  bool getBool({required String key})
  {
    return _sharedPreferences.getBool(key)??false;
  }


  Future<void>  setString({required String key,required String value}) async
  {
    await _sharedPreferences.setString(key, value);
  }


  String? getString({required String key})
  {
    return _sharedPreferences.getString(key);
  }

  Future<void> setInt({required String key,required int value}) async
  {

    await _sharedPreferences.setInt(key, value);

  }

  int? getInt({required String key})
  {
    return _sharedPreferences.getInt(key);
  }


}




