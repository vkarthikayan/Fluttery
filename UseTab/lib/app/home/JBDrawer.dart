import 'package:flutter/material.dart';

class JBDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "Hello !!!!",
              textAlign: TextAlign.justify,
              textScaleFactor: 2.0,
            ),
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: Text("How to Guides"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text("Find Your Fit"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: Text("Support"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: Text("Pair new headphones"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: Text("Shop Jaybird"),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
