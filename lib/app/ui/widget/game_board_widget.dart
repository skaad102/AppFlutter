import 'package:flutter/material.dart';
import 'package:rutas_app/app/models/game_model.dart';

class GameBoard extends StatefulWidget {
  WordleGameModel gameModel;
  GameBoard(this.gameModel, {Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          widget.gameModel.wordleBoard.map((e) => RowWordlRandom(e)).toList(),
    );
  }
}

class RowWordlRandom extends StatelessWidget {
  List<Letter> e;
  RowWordlRandom(
    this.e, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: e
          .map(
            (e) => Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: e.code == 0
                    ? Colors.grey
                    : e.code == 1
                        ? Colors.green
                        : Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  e.letter!,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
