import 'package:flutter/material.dart';
import 'package:rutas_app/app/ui/widget/key_board_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Wordle'),
            const SizedBox(height: 20),
            KeyBoard()
          ],
        ),
      ),
    );
  }
}
