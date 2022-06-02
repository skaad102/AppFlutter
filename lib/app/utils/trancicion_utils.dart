import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rutas_app/app/ui/pages/acceso_page.dart';
import 'package:rutas_app/app/ui/pages/mapa_page.dart';

Future transicionPage(BuildContext context, Widget page) async {
  final permisoGps = await Permission.location.isGranted;
  final gpsActive = await Geolocator.isLocationServiceEnabled();

  if (permisoGps && gpsActive && (page is MapaPage)) {
    navegador_copy(context, page);
    return "";
  } else if (!permisoGps) {
    navegador_copy(context, AccesoGpsPage());

    return "necesario permitir gps";
  } else {
    return "activar gps";
  }
}

void navegador_copy(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 1500),
        transitionsBuilder: (context, animation, secAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ));
}
