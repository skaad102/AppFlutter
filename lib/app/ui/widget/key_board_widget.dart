import 'package:flutter/material.dart';

class KeyBoard extends StatefulWidget {
  KeyBoard({Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    final row1 = "QWERTYUIOP".split("");
    final row2 = "ASDFGHJKL".split("");
    final row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUMBIT"];
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: row1.map((key) {
              return Text(key);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
