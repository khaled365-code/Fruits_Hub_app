
import 'package:shared_preferences/shared_preferences.dart';

class CacheService
{
  CacheService._named();
  static final instance=CacheService._named();
  factory CacheService() => instance;

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


}