import 'package:flutter/material.dart';

import 'app/App.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey[800],
          accentColor: Colors.lime),
      home: App(),
    ));
