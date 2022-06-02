import 'package:flutter/material.dart';

class ButonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  ButonWidget({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // style: ,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
