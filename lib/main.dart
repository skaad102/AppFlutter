import 'package:flutter/material.dart';
import 'package:rutas_app/app/ui/routes/rutas.dart';
import 'package:rutas_app/app/ui/theme/colors_theme.dart';
import './app/ui/pages/loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoadingPage(),
      initialRoute: 'LoadingPage',
      routes: routes,
      theme: ColorTheme.materialTheme,
    );
  }
}
