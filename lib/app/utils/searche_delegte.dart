import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/search_model.dart';
import '../services/bloc/busqueda/busqueda_bloc.dart';

class MapSearchDelegate extends SearchDelegate<SearchResult> {
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
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin_circle),
            title: const Text('Add this location'),
            onTap: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin_circle),
            title: const Text('buildSuggestions'),
            onTap: () {
              final searchResult = SearchResult(cancelado: false, manual: true);
              /*  */
              context.read<BusquedaBloc>().add(OnShowIcon());
              close(context, searchResult);
            },
          )
        ],
      ),
    );
  }
}
