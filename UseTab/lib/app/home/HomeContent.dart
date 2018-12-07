import 'package:flutter/material.dart';

import '../widgets/JBSilverAppBar.dart';
import '../widgets/PresetTab.dart';
import '../widgets/ProfileTab.dart';
import '../widgets/RunningMusicTab.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: NestedScrollView(
          body: new TabBarView(
            children: <Widget>[
              new PresetTab(),
              new RunningMusicTab(),
              new ProfileTab(),
            ],
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              JBSliverAppBar(),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.lime,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.settings)),
                      Tab(icon: Icon(Icons.music_note)),
                      Tab(
                        icon: Icon(Icons.account_circle),
                      )
                    ],
                  ),
                ),
                pinned: true,
              )
            ];
          }),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
