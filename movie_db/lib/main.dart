import 'package:flutter/material.dart';
import 'package:movie_db/screens/RouteHandler.dart';
import 'package:movie_db/screens/Splash.dart';

void main() => runApp(new MaterialApp(
      onGenerateRoute: _getRouteSetting,
    ));

Route _getRouteSetting(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case '/':
      return new RouteHandler(
        builder: (_) => new Splash(
              seconds: 3,
              navigateAfterSeconds: '/list',
            ),
        settings: routeSetting,
      );
    case '/list':
      return new RouteHandler(
        builder: (_) => ListA(),
        settings: routeSetting,
      );
  }
  return null;
}

class ListA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "List A",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 35.0,
        ),
      ),
    );
  }
}
