import 'package:flutter/material.dart';
import 'package:rutas_app/app/ui/pages/mapa_page.dart';
import '/app/utils/trancicion_utils.dart';

import '../theme/colors_theme.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: transicionPage(context, MapaPage()),
        builder: (_, __) {
          return Container(
            color: ColorTheme.background,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ColorTheme.secundary,
              ),
            ),
          );
        },
      ),
    );
  }
}
