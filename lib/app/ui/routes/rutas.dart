import 'package:flutter/cupertino.dart';
import '../pages/acceso_page.dart';
import '../pages/mapa_page.dart';
import '../pages/loading_page.dart';

Map<String, Widget Function(BuildContext)> get routes => {
      'LoadingPage': (_) => LoadingPage(),
      'MapaPage': (_) => MapaPage(),
      'AccesPage': (_) => AccesoGpsPage(),
    };
