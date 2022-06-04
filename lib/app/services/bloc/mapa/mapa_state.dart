part of 'mapa_bloc.dart';

class MapaStateInitial {
  final bool mapaListo;

  MapaStateInitial({this.mapaListo = false});

  MapaStateInitial copyWith({bool? mapaListo}) {
    return MapaStateInitial(mapaListo: mapaListo ?? this.mapaListo);
  }
}
