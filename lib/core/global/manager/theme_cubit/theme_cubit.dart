import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<int> {
  ThemeCubit() : super(1);

  static ThemeCubit get(context)=>BlocProvider.of(context);
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
