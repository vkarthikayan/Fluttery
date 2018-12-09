import 'package:flutter/material.dart';
import 'package:handletab/app/home/JBDrawer.dart';

import 'home/CustomHomeContent.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: JBDrawer(),
      body: HomeContent(),
    );
  }
}
