

import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/my_input_validator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key, required this.onSaved,
  });

  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        hintText: 'البريد الإلكتروني',
        onSaved: (value)
        {
          onSaved(value);
        },
        validator: (value) => MyInputValidator.validateEmail(value),
        keyBoardType: TextInputType.emailAddress);
  }
}