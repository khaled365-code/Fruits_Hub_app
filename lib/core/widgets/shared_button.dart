




import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({super.key,required this.btnText,required this.onPressedBtn});

  final String btnText;
  final VoidCallback onPressedBtn;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        fixedSize: WidgetStatePropertyAll(Size(MediaQuery.sizeOf(context).width, 54))
      ),
      onPressed: onPressedBtn,
      child: Text(btnText,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.white
      ),),
    );
  }
}