import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class SearchResult {
  final bool cancelado;
  final bool manual;
  final LatLng latLng;
  final String nombreDestino;
  final String descripcion;

  SearchResult(
      {required this.cancelado,
      this.manual = false,
      this.latLng = const LatLng(0, 0),
      this.nombreDestino = '',
      this.descripcion = ''});
}
