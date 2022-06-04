import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/services/bloc/mapa/mapa_bloc.dart';
import 'package:rutas_app/app/ui/routes/rutas.dart';
import 'package:rutas_app/app/ui/theme/colors_theme.dart';
import './app/ui/pages/loading_page.dart';
import 'app/services/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => MapaBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoadingPage(),
        initialRoute: 'LoadingPage',
        routes: routes,
        theme: ColorTheme.materialTheme,
      ),
    );
  }
}
