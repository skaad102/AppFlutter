import 'package:flutter/material.dart';
import 'package:rutas_app/app/ui/widget/key_board_widget.dart';

import '../../services/key_services.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _wordleGameModel = keyService;

  @override
  void initState() {
    super.initState();
    _wordleGameModel.initKeyService();
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
              KeyBoard()
            ],
          ),
        ),
      ),
    );
  }
}
