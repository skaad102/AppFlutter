import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../theme/colors_theme.dart';
import 'package:rutas_app/app/utils/trancicion_utils.dart';
import '../pages/loading_page.dart';
import '../widget/buton_widget.dart';

import 'mapa_page.dart';

class AccesoGpsPage extends StatefulWidget {
  @override
  State<AccesoGpsPage> createState() => _AccesoGpsPageState();
}

class _AccesoGpsPageState extends State<AccesoGpsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    /* nuevamente entra al app */
    if (state == AppLifecycleState.resumed) {
      /* validar si tenmos acceso */
      if (await Permission.location.isGranted) {
        transicionPage(context, LoadingPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡nececitamos acceso a tu hubicación!".toUpperCase(),
              style: TextStyle(color: ColorTheme.text),
            ),
            ButonWidget(
              text: 'Acceder',
              onPressed: onPressAcces,
            )
          ],
        ),
      ),
    );
  }

  void onPressAcces() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        // openAppSettings();
        transicionPage(context, MapaPage());
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.denied:
      case PermissionStatus.limited:
        openAppSettings();
        break;
    }
  }
}
