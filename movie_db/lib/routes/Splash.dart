import 'dart:async';

import 'package:flutter/material.dart';

const timeout = const Duration(seconds: 3);
const ms = const Duration(milliseconds: 1);

class Splash extends StatefulWidget {
  final int seconds;
  final dynamic navigateAfterSeconds;
  Splash({@required this.seconds, this.navigateAfterSeconds});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "Splash",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 35.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: widget.seconds), () {
      if (widget.navigateAfterSeconds is String) {
        Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
      } else if (widget.navigateAfterSeconds is Widget) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => widget.navigateAfterSeconds));
      } else {
        throw new ArgumentError("Supply proper arguments");
      }
    });
  }
}
