import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/app/model/search_model.dart';

import '../../services/bloc/busqueda/busqueda_bloc.dart';
import '../../utils/searche_delegte.dart';
import '../theme/colors_theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        if (!state.seleccionManual) {
          return Bounce(
            from: 20,
            child: buildBody(context),
          );
        }
        return Container();
      },
    );
  }

  Widget buildBody(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(left: 28),
          alignment: Alignment.centerLeft,
          width: width,
          height: 50,
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
          child: const Text(
            'Que estas Buscando?',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        onTap: () async {
          final cancelado =
              await showSearch(context: context, delegate: MapSearchDelegate());
          retornoBusqueda(cancelado!);
        },
      ),
    );
  }

  void retornoBusqueda(SearchResult result) {
    if (result.cancelado) return;
  }
}
