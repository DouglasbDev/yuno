import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:yuno/app/core/themes/theme.dart';
import 'package:yuno/routes.dart';

import 'interactor/atoms/config_atom.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      return MaterialApp.router(
        title: 'YuNO',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: gameConfigState.value.themeMode,
        routerConfig: Routefly.routerConfig(
          routes: routes,
          initialPath: routePaths.splash,
          observers: [
            HeroController(),
          ],
          routeBuilder: (context, settings, child) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, a1, a2) {
                return child;
              },
              transitionsBuilder: (context, a1, a2, child) {
                return FadeTransition(
                  opacity: a1,
                  child: child,
                );
              },
            );
          },
        ),
      );
    });
  }
}
