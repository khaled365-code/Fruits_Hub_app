

import 'package:equatable/equatable.dart';

class ProgressBarDataEntity extends Equatable
{

   final String itemName;
   final int itemNum;


   const ProgressBarDataEntity({required this.itemName, required this.itemNum});

  @override
  List<Object?> get props => [itemNum];







}