part of 'mi_ubicacion_bloc.dart';

/* como quiero que inicie el bloc */
@immutable
class MiUbicacionStateInicial {
  final bool siguiengo;
  final bool existeUbicacion;
  final LatLng? ubicacion;

  const MiUbicacionStateInicial(
      {this.siguiengo = true, this.existeUbicacion = false, this.ubicacion});

/* crear copia del estado */
  MiUbicacionStateInicial copyWith({
    bool? siguiengo,
    bool? existeUbicacion,
    LatLng? ubicacion,
  }) =>
      MiUbicacionStateInicial(
        siguiengo: siguiengo ?? this.siguiengo,
        existeUbicacion: existeUbicacion ?? this.existeUbicacion,
        ubicacion: ubicacion ?? this.ubicacion,
      );
}
