

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_commerce_app/core/global/my_input_validator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class FloorNumberField extends StatelessWidget {
  const FloorNumberField({
    super.key,required this.onSaved,
  });

  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        textFormatterList: [
          FilteringTextInputFormatter.digitsOnly
        ],
        hintText: 'رقم الطابق , رقم الشقه ..',
        onSaved: (value)
        {
          onSaved(value);
        },
        validator: MyInputValidator.basicValidation,
        keyBoardType: TextInputType.number);
  }
}