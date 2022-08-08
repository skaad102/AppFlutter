import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:http/http.dart' as http;

import '../../model/ruta_point.dart';
import '../../model/search_gecoding.dart';
import '../../utils/debouncer.dart';

class RutaPointApi {
  /* Creacion del singelton
    RutaPointApi rutaPointApi = RutaPointApi();
    simepre es la misma instancia de la clase
   */
  RutaPointApi._privateConstructor();
  static final RutaPointApi _instance = RutaPointApi._privateConstructor();
  factory RutaPointApi() => _instance;

  final debouncer =
      Debouncer<String>(duration: const Duration(milliseconds: 500));
  final _baseUrl = "api.mapbox.com";
  final _apiKey =
      "pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWxyOGVyMGd4bzNkazdjM2FwcnVqMSJ9.KMSVvRax_KNIRjPj5Vy3Kg";

  /* strem para disparar la busqueda programada 1/2 seg */
  StreamController<SearchGeocoding> _streamControllerGeo =
      StreamController<SearchGeocoding>.broadcast();

  Stream<SearchGeocoding> get stream => _streamControllerGeo.stream;

  Future<RutaPoint> getInicioDestino(LatLng inicio, LatLng destino) async {
    final cordenadas =
        "${inicio.longitude},${inicio.latitude};${destino.longitude},${destino.latitude}";
    final url =
        Uri.https(_baseUrl, "directions/v5/mapbox/driving/$cordenadas", {
      "alternatives": "true",
      "steps": "false",
      "geometries": "polyline6",
      "access_token": _apiKey,
      "language": "es"
    });
    final response = await http.get(url);
    // final cliente = http.Client();
    // final response2 = await cliente.get(url, headers: {
    //   "alternatives": "true",
    //   "overview": "simplified",
    //   "steps": "false",
    //   "geometries": "polyline6",
    //   "access_token": _apiKey,
    //   "language": "es",
    // });

    if (response.statusCode == 200) {
      final data = rutaPointFromJson(response.body);
      return data;
    } else {
      throw Exception("Error al obtener la ruta");
    }
  }

  Future<SearchGeocoding> getDirections(LatLng hubicacion, String query) async {
    try {
      final url =
          Uri.https(_baseUrl, "geocoding/v5/mapbox.places/$query.json", {
        "access_token": _apiKey,
        "language": "es",
        "limit": "3",
        "proximity": "${hubicacion.longitude},${hubicacion.latitude}",
        "autocomplete": "true"
      });

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = searchGeocodingFromJson(response.body);
        return data;
      } else {
        throw Exception("Error al obtener listado de direcciones");
      }
    } catch (e) {
      return SearchGeocoding(
          type: "FeatureCollection",
          query: [""],
          features: [],
          attribution: "");
    }
  }

  void getSugerenciasPorQuery(
    LatLng proximidad,
    String busqueda,
  ) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final resultados = await getDirections(proximidad, value);
      _streamControllerGeo.add(resultados);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      debouncer.value = busqueda;
    });

    Future.delayed(const Duration(milliseconds: 201))
        .then((_) => timer.cancel());
  }
}
