


import 'package:equatable/equatable.dart';

class LoginOptionsModel extends Equatable
{

  final String loginIcon,loginOptionText;

  const LoginOptionsModel(this.loginIcon,this.loginOptionText);

  @override
  List<Object?> get props => [loginIcon,loginOptionText];


}