


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
       log('on created ${bloc.runtimeType}');
     }
  }

  @override
  void onChange(BlocBase bloc, Change change)
  {
    super.onChange(bloc, change);
    if(kDebugMode)
    {
      log('on change ${bloc.runtimeType} to $change');
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
       log('on Error : ${bloc.runtimeType} with error : $error');
     }
  }





}