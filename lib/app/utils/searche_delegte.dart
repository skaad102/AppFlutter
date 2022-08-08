import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/search_model.dart';
import '../services/api/ruta_point_api.dart';
import '../services/bloc/busqueda/busqueda_bloc.dart';
import 'package:rutas_app/app/model/search_gecoding.dart';

import '../services/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

class MapSearchDelegate extends SearchDelegate<SearchResult> {
  final RutaPointApi rutaPointApi = RutaPointApi();
  @override
  // final LatLng _ubicacion;

  // MapSearchDelegate();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    final searchResult = SearchResult(cancelado: true);
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, searchResult);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final ubicacion = context.read<MiUbicacionBloc>().state.ubicacion;

    return _construirResultadosSugerencias(ubicacion);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final ubicacion = context.read<MiUbicacionBloc>().state.ubicacion;
    if (query.isEmpty) {
      return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin_circle),
            title: const Text('Historial'),
            onTap: () {
              final searchResult = SearchResult(cancelado: false, manual: true);
              /*  */
              context.read<BusquedaBloc>().add(OnShowIcon());
              close(context, searchResult);
            },
          )
        ],
      );
    }
    return _construirResultadosSugerencias(ubicacion);
  }

/* listar resultados con un listView */
  StreamBuilder<SearchGeocoding> _construirResultadosSugerencias(
      LatLng? ubicacion) {
    // final futureUbicaciones =
    // rutaPointApi.getDirections(ubicacion!, query.trim());
    rutaPointApi.getSugerenciasPorQuery(ubicacion!, query.trim());
    final sugerenciasStrem = rutaPointApi.stream;
    return StreamBuilder(
      stream: sugerenciasStrem,
      builder: (_, AsyncSnapshot<SearchGeocoding> snapshot) {
        if (snapshot.hasData) {
          final lugares = snapshot.data!.features;
          return ListView.separated(
            itemBuilder: (_, i) {
              final lugar = lugares[i];
              return ListTile(
                leading: Text(lugar.placeName),
                onTap: () {},
              );
            },
            separatorBuilder: (_, i) => const Divider(),
            itemCount: lugares.length,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
