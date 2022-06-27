part of 'mapa_bloc.dart';

class MapaStateInitial {
  final bool mapaListo;
  final bool dibujarRuta;
  final bool seguirRuta;
  final LatLng ubicacionCentral;
  final Map<String, Polyline>? polylines;

  /* TODO : Refact */
  MapaStateInitial(
      {this.mapaListo = false,
      this.dibujarRuta = false,
      this.seguirRuta = false,
      this.ubicacionCentral = const LatLng(0, 0),
      Map<String, Polyline>? polylines})
      // this.polylines = const {}});
      : polylines = polylines ?? {};

/* emitir nuevos estados del mapa */
  MapaStateInitial copyWith({
    bool? mapaListo,
    bool? dibujarRuta,
    bool? seguirRuta,
    LatLng? ubicacionCentral,
    Map<String, Polyline>? polylines,
  }) {
    return MapaStateInitial(
        mapaListo: mapaListo ?? this.mapaListo,
        dibujarRuta: dibujarRuta ?? this.dibujarRuta,
        seguirRuta: seguirRuta ?? this.seguirRuta,
        ubicacionCentral: ubicacionCentral ?? this.ubicacionCentral,
        polylines: polylines ?? this.polylines);
  }
}
