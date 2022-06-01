import 'package:flutter/cupertino.dart';

Future transicionPage(BuildContext context, Widget page) async {
  await Future.delayed(const Duration(milliseconds: 1200));
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 1500),
        transitionsBuilder: (context, animation, secAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ));
}
