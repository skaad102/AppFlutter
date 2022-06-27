import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/services/bloc/mapa/mapa_bloc.dart';

import '../../services/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

class BtnLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        child: FloatingActionButton(
            heroTag: 'btn_location',
            onPressed: () {
              final positionCurrent =
                  context.read<MiUbicacionBloc>().state.ubicacion;
              context.read<MapaBloc>().moveCurrentPosition(positionCurrent);
            },
            child: const Icon(
              Icons.location_on,
            )),
      ),
    );
  }
}
