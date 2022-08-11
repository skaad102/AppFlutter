import 'package:flutter/material.dart';
import 'package:rutas_app/app/ui/widget/game_board_widget.dart';

import '../../models/game_model.dart';

class KeyBoard extends StatefulWidget {
  WordleGameModel gameModel;
  KeyBoard(this.gameModel, {Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    final row1 = "QWERTYUIOP".split("");
    final row2 = "ASDFGHJKL".split("");
    final row3 = ["Z", "X", "C", "V", "B", "N", "M"];
    final row4 = ["DEL", "SUMBIT"];
    return Container(
      // color: Colors.blue,
      child: Column(
        // logic game
        // kyboard
        children: [
          Text(WordleGameModel.game_message),
          const SizedBox(height: 20),
          GameBoard(widget.gameModel),
          FilaKuys(row1: row1),
          FilaKuys(row1: row2),
          FilaKuys(row1: row3),
          FilaKuys(row1: row4),
        ],
      ),
    );
  }
}

class FilaKuys extends StatelessWidget {
  const FilaKuys({
    Key? key,
    required this.row1,
  }) : super(key: key);

  final List<String> row1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row1.map(
        (key) {
          return InkWell(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(key,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            onTap: () {
              widget.gameModel.addLetter(key);
            },
          );
        },
      ).toList(),
    );
  }
}
