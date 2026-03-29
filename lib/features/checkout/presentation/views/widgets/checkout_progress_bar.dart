

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/progress_bar_data_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/general_progress_bar_item.dart';

class CheckoutProgressBar extends StatelessWidget {
  const CheckoutProgressBar({super.key,required this.currentScreenIndex,
  this.payWithCash=false
  });


  static const List<ProgressBarDataEntity> progressDataList=
  [
    ProgressBarDataEntity(itemName: 'الشحن', itemNum: 1),
    ProgressBarDataEntity(itemName: 'العنوان', itemNum: 2),
    ProgressBarDataEntity(itemName: 'الدفع', itemNum: 3),
    ProgressBarDataEntity(itemName: 'المراجعه', itemNum: 4),
  ];
  static const List<ProgressBarDataEntity> progressPayWithCashList=
  [
    ProgressBarDataEntity(itemName: 'الشحن', itemNum: 1),
    ProgressBarDataEntity(itemName: 'العنوان', itemNum: 2),
    ProgressBarDataEntity(itemName: 'المراجعه', itemNum: 3),
  ];


  final int currentScreenIndex;
  final bool payWithCash;

  @override
  Widget build(BuildContext context) {
    return payWithCash==true?
    Row(
        children:
        List.generate(3, (index)=>
            Expanded(
              child: GeneralProgressBarItem(
                itemIsActive: currentScreenIndex==index || index<currentScreenIndex,
                progressEntityItem: progressPayWithCashList[index],),
            ))

    ): Row(
        children:
        List.generate(4, (index)=>
        Expanded(
          child: GeneralProgressBarItem(
            itemIsActive: currentScreenIndex==index || index<currentScreenIndex,
            progressEntityItem: progressDataList[index],),
        ))

    );
  }
}
