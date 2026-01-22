part of 'login_bloc.dart';

@immutable
final class LoginState extends Equatable {

  final RequestStates requestState;
  final String errorMessage;
  final UserEntity? user;
  final AutovalidateMode loginValidateMode;


  const LoginState({this.requestState=RequestStates.initial,
  this.errorMessage='',
  this.user,
  this.loginValidateMode=AutovalidateMode.disabled
  });



  LoginState copyWith({RequestStates? requestState,String? errorMessage,UserEntity? userEntity,AutovalidateMode? loginValidateMode})
  {
    return LoginState(
      requestState: requestState??this.requestState,
      errorMessage: errorMessage??this.errorMessage,
      user: userEntity??this.user,
      loginValidateMode: loginValidateMode??this.loginValidateMode,
    );
  }

  @override
  List<Object?> get props => [requestState,errorMessage,user,loginValidateMode];

}




