import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';
part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionStateInicial> {
  /* seguimiento con google_masp_flutter */

  late StreamSubscription<Position> getPositionStream;

  void iniciarSeguimiento() {
    const geoLocatorOptios = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
    getPositionStream =
        Geolocator.getPositionStream(locationSettings: geoLocatorOptios)
            .listen((Position position) {
      final ubicacion = LatLng(position.latitude, position.longitude);
      add(UbicacionCambio(ubicacion));
    });
  }

  void cacelarSeguemiento() {
    getPositionStream.cancel();
  }

  MiUbicacionBloc() : super(MiUbicacionStateInicial()) {
    on<UbicacionCambio>((event, emit) {
      emit(state.copyWith(
        existeUbicacion: true,
        ubicacion: event.ubicacion,
      ));
    });
  }
}
