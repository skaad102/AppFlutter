part of 'mi_ubicacion_bloc.dart';

@immutable
abstract class MiUbicacionEvent {}

class UbicacionCambio extends MiUbicacionEvent {
  final LatLng ubicacion;
  UbicacionCambio(this.ubicacion);
}
