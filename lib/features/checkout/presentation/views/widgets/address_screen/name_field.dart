



import 'package:flutter/material.dart';
import 'package:fruits_commerce_app/core/global/my_input_validator.dart';
import 'package:fruits_commerce_app/core/widgets/custom_outlined_text_field_widget.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.onSaved
  });

  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
        validator: MyInputValidator.basicValidation,
        hintText: 'الاسم كامل',
        onSaved: (value)
        {
          onSaved(value);
        },
        keyBoardType: TextInputType.text);
  }
}