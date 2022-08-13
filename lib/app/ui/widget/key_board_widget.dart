import 'package:flutter/material.dart';
import 'package:rutas_app/app/services/key_services.dart';
import 'package:rutas_app/app/ui/widget/game_board_widget.dart';

import '../../models/game_model.dart';

class KeyBoard extends StatefulWidget {
  KeyBoard({Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  final _wordleGameModel = keyService;

  @override
  Widget build(BuildContext context) {
    final row1 = "QWERTYUIOP".split("");
    final row2 = "ASDFGHJKL".split("");
    final row3 = ["Z", "X", "C", "V", "B", "N", "M"];
    final row4 = ["DEL", "SUMBIT"];
    return StreamBuilder<WordleGameModel>(
        stream: _wordleGameModel.keyStrem,
        builder: (context, snapshot) {
          return Column(
            // logic game
            // kyboard
            children: [
              Text(_wordleGameModel.gameModel.game_message),
              const SizedBox(height: 20),
              GameBoard(),
              FilaKuys(1, row1: row1),
              FilaKuys(2, row1: row2),
              FilaKuys(3, row1: row3),
              FilaKuys(4, row1: row4),
            ],
          );
        });
  }
}

class FilaKuys extends StatelessWidget {
  final int id;
  FilaKuys(
    this.id, {
    Key? key,
    required this.row1,
  }) : super(key: key);

  final List<String> row1;

  @override
  final _wordleGameModel = keyService;
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
            onTap: () => presKey(key),
          );
        },
      ).toList(),
    );
  }

  void presKey(String key) {
    switch (key) {
      case "DEL":
        if (_wordleGameModel.gameModel.letterId > 0) {
          keyService.delKey(_wordleGameModel.gameModel, Letter("", 0));
        }
        break;
      case "SUMBIT":
        if (_wordleGameModel.gameModel.letterId >= 5) {
          keyService.submitKey(_wordleGameModel.gameModel);
        }
        break;
      default:
        if (_wordleGameModel.gameModel.letterId < 5) {
          keyService.cargarKey(_wordleGameModel.gameModel, Letter(key, 0));
        }
        break;
    }
  }
}
