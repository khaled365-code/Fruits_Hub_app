import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_commerce_app/core/global/constants/app_constants.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {


  static get(BuildContext context)=>BlocProvider.of(context);

  GlobalKey<FormState> loginFormKey=GlobalKey();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  final AuthRepo authRepo;


  LoginBloc({required this.authRepo}) : super(LoginState()) {
    on<LoginEvent>((event, emit) async
    {
      if(event is LoginUsingEmailAndPasswordEvent)
        {
          emit(state.copyWith(requestState: RequestStates.loading));
          var result=await authRepo.signInUsingEmailAndPassword(email: event.email, password: event.password);;
          result.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.callBack,requestState: RequestStates.error)),
          (userEntity) => emit(state.copyWith(userEntity: userEntity,requestState: RequestStates.success)),
         );
      }
      if(event is ChangeValidationModeEvent)
        {
          emit(state.copyWith(loginValidateMode: AutovalidateMode.always));
        }
    });
  }
}
