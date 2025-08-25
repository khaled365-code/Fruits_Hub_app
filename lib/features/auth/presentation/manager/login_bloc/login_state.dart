part of 'login_bloc.dart';


class LoginState extends Equatable {

  final RequestStates requestState;


  const LoginState({this.requestState=RequestStates.initial});



  LoginState copyWith({RequestStates? requestState})
  {
    return LoginState(
      requestState: requestState??this.requestState
    );
  }




  @override
  List<Object?> get props => [requestState];



}

