import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:meta/meta.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {


  static get(BuildContext context)=>BlocProvider.of(context);

  AutovalidateMode loginValidateMode=AutovalidateMode.disabled;
  GlobalKey<FormState> loginFormKey=GlobalKey();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) async
    {
      if(event is LoginUsingEmailAndPasswordEvent)
        {
          emit(state.copyWith(requestState: RequestStates.loading));
          await Future.delayed(Duration(seconds:10),(){
            if(event.email=='khaled.mohamed.dev.tech@gmail.com' && event.password=='khaled123')
            {
              emit(state.copyWith(requestState: RequestStates.success));
            }
            else
            {
              emit(state.copyWith(requestState: RequestStates.error));
            }
          });


        }
    });
  }
}
