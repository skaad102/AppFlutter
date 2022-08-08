import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rutas_app/app/services/bloc/mapa/mapa_bloc.dart';
import 'package:rutas_app/app/services/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:rutas_app/app/ui/widget/buton_seguir.dart';

import '../widget/buton_ocultar_ubicacion.dart';
import '../widget/buton_ubicacion_widget.dart';
import '../widget/icon_route_widget.dart';
import '../widget/serbar_widget.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  void initState() {
    context.read<MiUbicacionBloc>().iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    context.read<MiUbicacionBloc>().cacelarSeguemiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          BlocBuilder<MiUbicacionBloc, MiUbicacionStateInicial>(
            builder: (_, state) {
              return printMap(state);
            },
          ),
          /* Buscador de rutas */
          const SearchBar(),
          /* pintar el resultado serarch */
          const IconRoute(),
        ]),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BtnLocation(),
            BtnFollow(),
            BtnShowLocation(),
          ],
        ),
      ),
    );
  }

  Widget printMap(MiUbicacionStateInicial state) {
    if (!state.existeUbicacion) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Text('Buscando..')),
          CircularProgressIndicator()
        ],
      );
    }

    final initialCameraPosition = CameraPosition(
      target: state.ubicacion!,
      zoom: 16,
    );

    final blocMapa = BlocProvider.of<MapaBloc>(context);
    // final blocMapa = context.read<MapaBloc>();

    blocMapa.add(MarcarRuta(state.ubicacion!));

    return BlocBuilder<MapaBloc, MapaStateInitial>(
      builder: (context, _) {
        return GoogleMap(
          initialCameraPosition: initialCameraPosition,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          mapType: MapType.normal,
          polylines: blocMapa.state.polylines!.values.toSet(),
          onMapCreated: (GoogleMapController controller) {
            blocMapa.initMapaBloc(controller);
          },
          onCameraMove: (cameraPosition) {
            final centroMapa = cameraPosition.target;
            blocMapa.add(MoverMapa(centroMapa));
          },
        );
      },
    );
  }
}
