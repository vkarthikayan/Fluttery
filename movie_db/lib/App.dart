import 'package:flutter/material.dart';

import 'routes/ListA.dart';
import 'routes/RouteHandler.dart';
import 'routes/Routes.dart';
import 'routes/Splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(onGenerateRoute: _getRouteSetting);
  }

  Route _getRouteSetting(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case SPLASH_SCREEN:
        return new RouteHandler(
          builder: (_) => new Splash(
                seconds: 3,
                navigateAfterSeconds: HOME_SCREEN,
              ),
          settings: routeSetting,
        );
      case HOME_SCREEN:
        return new RouteHandler(
          builder: (_) => ListA(),
          settings: routeSetting,
        );
    }
    return null;
  }
}
