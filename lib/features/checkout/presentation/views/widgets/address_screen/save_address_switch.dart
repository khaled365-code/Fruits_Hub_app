

import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_commerce_app/core/widgets/space_widget.dart';

class SaveAddressSwitch extends StatefulWidget {
  const SaveAddressSwitch({super.key});

  @override
  State<SaveAddressSwitch> createState() => _SaveAddressSwitchState();
}

class _SaveAddressSwitchState extends State<SaveAddressSwitch> {


  bool addressActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
        [
          Container(
            height: 30,
            child: FittedBox(
              child: Switch(
                padding: EdgeInsetsDirectional.zero,
               activeThumbColor: AppColors.white,
               activeTrackColor: AppColors.primaryColor,
               value: addressActive, onChanged: (value){
                addressActive=value;
                setState(() {

                });
              }),
            ),
          ),
          const SpaceWidget(width: 8,),
          Text('حفظ العنوان',style: Theme.of(context).textTheme.labelMedium?.copyWith(
             color: AppColors.c949D9E
           ),)
        ],
      );
  }
}
