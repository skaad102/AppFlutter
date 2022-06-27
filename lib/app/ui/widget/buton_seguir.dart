import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/services/bloc/mapa/mapa_bloc.dart';

class BtnFollow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapaBloc>();
    return BlocBuilder<MapaBloc, MapaStateInitial>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: FloatingActionButton(
                    heroTag: 'btn_follow',
                    onPressed: () {
                      bloc.add(SeguirRuta());
                    },
                    child: (bloc.state.seguirRuta)
                        ? const Icon(Icons.accessibility_new)
                        : const Icon(Icons.directions_walk_outlined),
                  ),
                )
              ],
            ));
      },
    );
  }
}
