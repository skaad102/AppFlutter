import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/service/bloc/key_bloc.dart';
import 'package:rutas_app/app/ui/routes/app_routes.dart';

void main() => runApp(DevicePreview(
      enabled: true,
      builder: (contex) => MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KeyBloc>(create: (_) => KeyBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: routesApp,
        initialRoute: routesApp.keys.first,
        theme: ThemeData.dark(),
      ),
    );
  }
}
