import 'package:flutter/material.dart';

import '../pages/game_page.dart';

Map<String, Widget Function(BuildContext)> get routesApp => {
      'gamePage': (context) => const GamePage(),
    };
