import 'package:flutter/material.dart';

import '../home/CustomHomeContent.dart';

class JBSliverAppBar extends StatefulWidget {
//  JBSliverAppBar();
  @override
  State<JBSliverAppBar> createState() => new _JBSliverAppBarState();
}

class _JBSliverAppBarState extends State<JBSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    print("_JBSliverAppBarState .. changes ");

    return SliverAppBar(
      expandedHeight: 50.0,
      floating: false,
      pinned: false,
      actions: <Widget>[
        new Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            height: 30.0,
            width: 150.0,
            child: Row(
              children: getIconSets(index),
            ),
          ),
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(getHeaders(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            )),
      ),
    );
  }

  List<Widget> getIconSets(tabState) {
    if (tabState == 0) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        )
      ];
    } else if (tabState == 1) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        )
      ];
    } else {
      return <Widget>[];
    }
  }

  String getHeaders() {
    if (index == 0) {
      return "Presets";
    } else if (index == 1) {
      return "Running Music";
    } else {
      return "Profile";
    }
  }
}
