import 'dart:io';

import 'package:flutter/material.dart';

void esperaRuta(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Espera un momento"),
              content: Text("Estamos buscando la ruta"),
            ));
  } else {
    /* TODO Para Ios */
  }
}
