

import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/my_input_validator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class CityField extends StatelessWidget {
  const CityField({
    super.key, required this.onSaved,
  });

  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        hintText: 'المدينه',
        onSaved: (value)
        {
          onSaved(value);
        },
        validator: MyInputValidator.basicValidation,
        keyBoardType: TextInputType.text);
  }
}