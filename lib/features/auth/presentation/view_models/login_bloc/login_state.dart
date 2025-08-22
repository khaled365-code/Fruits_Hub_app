part of 'login_bloc.dart';


class LoginState extends Equatable {

  final RequestsStates requestState;


  const LoginState({this.requestState=RequestsStates.initial});



  LoginState copyWith({RequestsStates? requestState})
  {
    return LoginState(
      requestState: requestState??this.requestState
    );
  }




  @override
  List<Object?> get props => [requestState];



}

