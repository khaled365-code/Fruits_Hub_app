import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutState());





  int currentScreenIndex=0;
  void changeCurrentScreenIndex({required int newScreenIndex})
  {
    currentScreenIndex=newScreenIndex;
    emit(state.copyWith(currentScreenIndex: newScreenIndex));
  }

}
