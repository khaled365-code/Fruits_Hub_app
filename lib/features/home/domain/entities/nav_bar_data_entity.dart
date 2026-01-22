


import 'package:equatable/equatable.dart';

class NavBarDataEntity extends Equatable
{
  final String navBarIcon;
  final String navBarTitle;

  const NavBarDataEntity({required this.navBarIcon,required this.navBarTitle});
  @override
  List<Object?> get props => [navBarIcon,navBarTitle];


}