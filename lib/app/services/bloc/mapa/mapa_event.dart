part of 'mapa_bloc.dart';

@immutable
abstract class MapaEvent {}

class MapaListo extends MapaEvent {}

class MarcarRuta extends MapaEvent {
  final LatLng ubicacion;
  MarcarRuta(this.ubicacion);
}

class DesmarcarRuta extends MapaEvent {}

class SeguirRuta extends MapaEvent {}

class MoverMapa extends MapaEvent {
  final LatLng centroMapa;
  MoverMapa(this.centroMapa);
}
