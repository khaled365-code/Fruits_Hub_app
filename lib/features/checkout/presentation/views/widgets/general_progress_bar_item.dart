


import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/features/checkout/domain/entities/progress_bar_data_entity.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/active_progress_bar_item.dart';
import 'package:fruits_commerce_app/features/checkout/presentation/views/widgets/inactive_progress_bar_item.dart';

class GeneralProgressBarItem extends StatelessWidget {
  const GeneralProgressBarItem({super.key,required this.itemIsActive,required this.progressEntityItem});
  
  final bool itemIsActive;
  final ProgressBarDataEntity progressEntityItem;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: ActiveProgressBarItem(itemName: progressEntityItem.itemName),
        secondChild: InactiveProgressBarItem(progressEntityItem: progressEntityItem,)
        , crossFadeState: itemIsActive? CrossFadeState.showFirst:CrossFadeState.showSecond,
        duration: const Duration(seconds: 1));
  }
}
