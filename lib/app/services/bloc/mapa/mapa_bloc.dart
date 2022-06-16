import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rutas_app/app/ui/theme/mapa_theme.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaStateInitial> {
  late GoogleMapController _mapController;
  Polyline _ruta = const Polyline(
    polylineId: PolylineId("ruta"),
    width: 3,
    color: Colors.black,
  );
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
        emit(MapaStateInitial(
          mapaListo: true,
        ));
      },
    );
    on<MarcarRuta>(
      (event, emit) {
        _marcarUnicacion(event, emit);
      },
    );

    on<DesmarcarRuta>(
      (event, emit) {
        _desmarcarUnicacion(event, emit);
      },
    );

    on<SeguirRuta>(
      (event, emit) {
        _seguirRuta(event, emit);
      },
    );
    on<MoverMapa>(
      (event, emit) {
        // emit(MapaStateInitial(
        //   ubicacionCentral: event.centroMapa,
        // ));
        emit(state.copyWith(
          ubicacionCentral: event.centroMapa,
        ));
        print("MoverMapa ${event.centroMapa}");
      },
    );
  }

  void _marcarUnicacion(MarcarRuta event, Emitter<MapaStateInitial> emit) {
    if (state.seguirRuta) moveCurrentPosition(event.ubicacion);
    final puntos = [..._ruta.points, event.ubicacion];
    _ruta = _ruta.copyWith(pointsParam: puntos);
    final polylinesActuales = state.polylines;
    polylinesActuales?['ruta'] = _ruta;
    emit(state.copyWith(
      dibujarRuta: true,
      polylines: polylinesActuales,
    ));
  }

  void _desmarcarUnicacion(
      DesmarcarRuta event, Emitter<MapaStateInitial> emit) {
    state.dibujarRuta
        ? _ruta = _ruta.copyWith(colorParam: Colors.transparent)
        : _ruta = _ruta.copyWith(colorParam: Colors.black);
    final polylinesActuales = state.polylines;
    polylinesActuales?['ruta'] = _ruta;
    emit(state.copyWith(
      dibujarRuta: !state.dibujarRuta,
      polylines: polylinesActuales,
    ));
  }

  void _seguirRuta(SeguirRuta event, Emitter<MapaStateInitial> emit) {
    emit(state.copyWith(seguirRuta: !state.seguirRuta));
  }
}
