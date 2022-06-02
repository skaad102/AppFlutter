import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '/app/ui/pages/mapa_page.dart';
import '/app/utils/trancicion_utils.dart';

import '../theme/colors_theme.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
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
    final gpsActive = await Geolocator.isLocationServiceEnabled();
    if (state == AppLifecycleState.resumed) {
      if (gpsActive) {
        transicionPage(context, MapaPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: transicionPage(context, MapaPage()),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return Center(child: Text(snapshot.data));
          } else {
            /* TODO: no hace una mierda */
            return Container(
              color: ColorTheme.background,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorTheme.secundary,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
