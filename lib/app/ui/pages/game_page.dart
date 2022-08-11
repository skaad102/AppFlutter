import 'package:flutter/material.dart';
import 'package:rutas_app/app/models/game_model.dart';
import 'package:rutas_app/app/ui/widget/key_board_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final gameModel = WordleGameModel();

  @override
  void initState() {
    super.initState();
    WordleGameModel.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Wordle'),
              const SizedBox(height: 20),
              KeyBoard(gameModel)
            ],
          ),
        ),
      ),
    );
  }
}
