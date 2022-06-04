import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:rutas_app/app/ui/theme/mapa_theme.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaStateInitial> {
  late GoogleMapController _mapController;
  void initMapaBloc(GoogleMapController controller) {
    if (!state.mapaListo) {
      _mapController = controller;
      controller.setMapStyle(jsonEncode(MapaUI.MAPATHEM));
      add(MapaListo());
    }
  }

  void moveCurrentPosition(LatLng? position) {
    final camaraUpdate = CameraUpdate.newLatLng(position!);

    _mapController.animateCamera(camaraUpdate);
  }

  MapaBloc() : super(MapaStateInitial()) {
    on<MapaListo>(
      (event, emit) {
        emit(MapaStateInitial(mapaListo: true));
      },
    );
  }
}
