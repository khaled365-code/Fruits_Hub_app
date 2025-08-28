part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable
{
  const LoginEvent();

}


final class LoginUsingEmailAndPasswordEvent extends LoginEvent
{
  final String email;
  final String password;
  const LoginUsingEmailAndPasswordEvent(this.email,this.password);

  @override
  List<Object?> get props => [email,password];

}

final class ChangeValidationModeEvent extends LoginEvent
{
  @override
  List<Object?> get props => [];

}
