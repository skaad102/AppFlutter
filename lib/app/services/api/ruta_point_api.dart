import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../model/ruta_point.dart';

class RutaPointApi {
  // List rutaPoint = [];
  // final _api =
  //     "https://api.mapbox.com/directions/v5/mapbox/driving/-72.39637103515008%2C5.334529615384454%3B-72.37597663303053%2C5.325208215136499?alternatives=true&geometries=polyline6&overview=simplified&steps=false&access_token=pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWx1ZnJzMGF1NjNjbGk4ZTkxZWw1bCJ9.qR11xCh2oXBCvyLdmjwlNg&language=es ";
  // Future getRutaPoint() async {
  //   final url = Uri.parse(_api);
  //   try {
  //     final response = await http.get(url);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       final data = rutaPointFromJson(response.body);
  //       print(data);
  //       final data2 = RutaPoint.fromJson(jsonDecode(response.body));
  //       print("data2: ${data2.routes}");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  /* Creacion del singelton
    RutaPointApi rutaPointApi = RutaPointApi();
    simepre es la misma instancia de la clase
   */
  RutaPointApi._privateConstructor();
  static final RutaPointApi _instance = RutaPointApi._privateConstructor();
  factory RutaPointApi() => _instance;

  final _baseUrl = "api.mapbox.com";
  final _apiKey =
      "pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWxyOGVyMGd4bzNkazdjM2FwcnVqMSJ9.KMSVvRax_KNIRjPj5Vy3Kg";

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
}


/* https://api.mapbox.com/directions/v5/mapbox/driving/-73.98660439230984%2C40.73395334763842%3B-73.9842891121566%2C40.73302015046892?alternatives=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWxyOGVyMGd4bzNkazdjM2FwcnVqMSJ9.KMSVvRax_KNIRjPj5Vy3Kg 

https://api.mapbox.com/directions/v5/mapbox/driving/?access_token=pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWxyOGVyMGd4bzNkazdjM2FwcnVqMSJ9.KMSVvRax_KNIRjPj5Vy3Kg&coordinates=5.3343861%2C-72.3970431%3B5.333832042293373%2C-72.39593502134083&overview=simplified&steps=false&alternatives=true&geometries=polyline6&language=es

https://api.mapbox.com/directions/v5/mapbox/driving/5.334385,-72.3970381;5.3373211647405485,-72.39098634570838?access_token=pk.eyJ1Ijoic2thYWQxMDIiLCJhIjoiY2w0aWxyOGVyMGd4bzNkazdjM2FwcnVqMSJ9.KMSVvRax_KNIRjPj5Vy3Kg&overview=simplified&steps=false&alternatives=true&geometries=polyline6&language=es
*/