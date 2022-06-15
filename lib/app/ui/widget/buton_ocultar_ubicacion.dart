import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/services/bloc/mapa/mapa_bloc.dart';

class BtnShowLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              child: FloatingActionButton(
                  onPressed: () {
                    context.read<MapaBloc>().add(DesmarcarRuta());
                  },
                  child: const Icon(
                    Icons.more_horiz,
                  )),
            )
          ],
        ));
  }
}
