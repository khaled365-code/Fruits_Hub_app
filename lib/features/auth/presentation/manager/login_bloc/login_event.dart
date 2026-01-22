part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable
{


}


final class LoginUsingEmailAndPasswordEvent extends LoginEvent
{
  final String email;
  final String password;
  LoginUsingEmailAndPasswordEvent(this.email,this.password);

  @override
  List<Object?> get props => [email,password];

}

final class ChangeValidationModeEvent extends LoginEvent
{
  @override
  List<Object?> get props => [];

}

final class SignInWithGoogleEvent extends LoginEvent
{
  @override
  List<Object?> get props => [];

}


final class SignInWithFacebookEvent extends LoginEvent
{
  @override
  List<Object?> get props => [];
}
