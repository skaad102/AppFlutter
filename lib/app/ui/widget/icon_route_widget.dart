import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/services/bloc/busqueda/busqueda_bloc.dart';
import '../theme/colors_theme.dart';

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
                      offset: Offset(0, 8),
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
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
