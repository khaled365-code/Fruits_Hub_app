


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_commerce_app/core/global/theme/app_colors.dart';

class CustomOutlinedTextField extends StatelessWidget {
  const CustomOutlinedTextField({super.key,required this.hintText,required this.controller,this.contentPadding, this.validator, this.textFormatterList,  this.minLines,  this.maxLines,  this.maxLength, required this.keyBoardType, this.onFieldSubmitted, required this.inputDataStyle, this.textInputAction,this.obSecureText=false, this.suffix, this.prefix});

  final String hintText;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? textFormatterList;
  final int? minLines,maxLines,maxLength;
  final TextInputType keyBoardType;
  final Function(String)? onFieldSubmitted;
  final TextStyle inputDataStyle;
  final TextInputAction? textInputAction;
  final bool obSecureText;
  final Widget? suffix;
  final Widget? prefix;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
    minLines: minLines,
    enabled: true,
    maxLines: maxLines,
    maxLength: maxLength,
    keyboardType: keyBoardType,
    onFieldSubmitted: onFieldSubmitted,
    inputFormatters: textFormatterList,
    cursorColor: AppColors.c0C0D0D,
    validator: validator,
    controller: controller,
    style: inputDataStyle,
      textInputAction: textInputAction,
      obscureText: obSecureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        contentPadding: contentPadding,
      ),
    );
  }
}
