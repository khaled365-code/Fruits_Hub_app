import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<int> {

  ThemeCubit._named():super(1);
  static final _instance =ThemeCubit._named();
  factory ThemeCubit() => _instance;



  int currentTheme=1;




  changeTheme(int newTheme)
  {
    if(currentTheme!=newTheme)
      {
        currentTheme=newTheme;
        emit(newTheme);
      }
  }

}
