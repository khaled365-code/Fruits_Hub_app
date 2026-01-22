part of 'main_layout_cubit.dart';

@immutable
final class MainLayoutState extends Equatable {

  final int currentScreenIndex;



  const MainLayoutState({this.currentScreenIndex=0});


  MainLayoutState copyWith({int? currentScreenIndex})
  {
    return MainLayoutState(
        currentScreenIndex: currentScreenIndex??this.currentScreenIndex);
  }

  @override
  List<Object?> get props => [currentScreenIndex];


}

