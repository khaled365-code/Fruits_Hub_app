


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class FruitsHubBlocObserver extends BlocObserver
{

  @override
  void onCreate(BlocBase bloc)
  {
    super.onCreate(bloc);
    if(kDebugMode)
     {
       log('${bloc.runtimeType} is created');
     }
  }

  @override
  void onChange(BlocBase bloc, Change change)
  {
    super.onChange(bloc, change);
    if(kDebugMode)
    {
      log('${bloc.runtimeType} is changed to : $change');
    }
  }


  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if(kDebugMode)
    {
      log('${bloc.runtimeType} is closed');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace)
  {
    super.onError(bloc, error, stackTrace);
    if(kDebugMode)
     {
       log('${bloc.runtimeType} has error , Error : $error');
     }
  }





}