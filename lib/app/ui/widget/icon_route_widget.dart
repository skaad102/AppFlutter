import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rutas_app/app/services/bloc/busqueda/busqueda_bloc.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:rutas_app/app/utils/espera_ruta.dart';
import '../../services/api/ruta_point_api.dart';
import '../../services/bloc/mapa/mapa_bloc.dart';
import '../../services/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import '../theme/colors_theme.dart';
// import 'package:polyline/polyline.dart' as Poly;

/* confirmar destino con el boton ir */
class IconRoute extends StatelessWidget {
  const IconRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(builder: ((context, state) {
      if (state.seleccionManual) {
        return _buildBody(context);
      }
      return Container();
    }));
  }

  Widget _buildBody(BuildContext context) {
    final tam = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: GestureDetector(
            child: BounceInLeft(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.tercery.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            onTap: () {
              context.read<BusquedaBloc>().add(OnHideIcon());
            },
          ),
          top: 45,
          left: 16,
        ),
        Center(
          child: BounceInDown(
            child: Transform.translate(
                offset: const Offset(0, -24),
                child: const Icon(
                  Icons.location_on,
                  size: 48,
                )),
          ),
        ),
        Positioned(
          bottom: 32,
          left: tam.width * 0.35,
          child: MaterialButton(
            color: ColorTheme.tercery,
            shape: const StadiumBorder(),
            child: const Text('Ir'),
            onPressed: () {
              confirmarDestino(context);
            },
          ),
        )
      ],
    );
  }

  void confirmarDestino(BuildContext context) async {
    /*  */
    final rutaPonte = RutaPointApi();
    final inicio = context.read<MiUbicacionBloc>().state.ubicacion;
    final destino = context.read<MapaBloc>().state.ubicacionCentral;
    final rutaPoint = await rutaPonte.getInicioDestino(inicio!, destino!);
    /* crear evento con punto inicio y final*/
    if (rutaPoint.routes.isNotEmpty) {
      final geometry = rutaPoint.routes[0].geometry;
      final duration = rutaPoint.routes[0].duration;
      final distance = rutaPoint.routes[0].distance;
      esperaRuta(context);
      /* decodificar */
      // final points =
      //     Poly.Polyline.Decode(encodedString: geometry, precision: 6);

      // final points = decodePolyline(
      //   geometry,
      // );

      final rutaCords = decodePolyline(geometry, accuracyExponent: 6)
          .map((e) => LatLng(e[0].toDouble(), e[1].toDouble()))
          .toList();

      // List<LatLng> rutaCords =
      // print({
      //   'rutaCords': points,
      //   'hubicacion': context.read<MiUbicacionBloc>().state.ubicacion,
      // });
      /* emitir evento */
      context
          .read<MapaBloc>()
          .add(CrearRutaInicioDestino(rutaCords, distance, duration));
      /* cerrar alerta */
      Navigator.pop(context);
      /* ocultar ir */
      context.read<BusquedaBloc>().add(OnHideIcon());
    }
  }
}
