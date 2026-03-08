



import 'dart:developer';

import 'package:flutter/foundation.dart';

class LoggerService
{

  LoggerService._named();

  static LoggerService? _instance;

  factory LoggerService()=> _instance ??= LoggerService._named();


  void logDebug(String message)
  {
    kDebugMode || kProfileMode?
    log(message):null;
  }


}