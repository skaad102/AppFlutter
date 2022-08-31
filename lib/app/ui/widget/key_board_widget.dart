import 'package:flutter/material.dart';
import 'package:rutas_app/app/service/bloc/key_bloc.dart';
import 'package:rutas_app/app/ui/widget/game_board_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/game_model.dart';

class KeyBoard extends StatefulWidget {
  KeyBoard({Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    final blocKey = context.read<KeyBloc>().state.gameModel;
    final row1 = "QWERTYUIOP".split("");
    final row2 = "ASDFGHJKL".split("");
    final row3 = ["Z", "X", "C", "V", "B", "N", "M"];
    final row4 = ["DEL", "SUMBIT"];
    return Column(
      // logic game
      // kyboard
      children: [
        BlocBuilder<KeyBloc, KeyInitial>(
            builder: (context, state) => Text(blocKey!.game_message)),
        const SizedBox(height: 20),
        GameBoard(),
        FilaKuys(row1: row1),
        FilaKuys(row1: row2),
        FilaKuys(row1: row3),
        FilaKuys(row1: row4),
      ],
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
    final blocKey = context.read<KeyBloc>();
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
              /* llamar con state */
              // if (blocKey.letterId < 5) {
              //   final keyPress = Letter(key, 0);
              //   blocKey.insertWord(blocKey.letterId, keyPress);
              //   blocKey.letterId++;
              //   blocKey.a
              //   print(blocKey.letterId);
              // }
              switch (key) {
                case "DEL":
                  blocKey.add(DelKey());
                  break;
                case "SUMBIT":
                  blocKey.add(SubmitKey());
                  break;
                default:
                  blocKey.add(AddKey(Letter(key, 0)));
                  break;
              }
            },
          );
        },
      ).toList(),
    );
  }
}
