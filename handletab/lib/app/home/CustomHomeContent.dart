import 'package:flutter/material.dart';

import '../widgets/JBSilverAppBar.dart';
import '../widgets/PresetTab.dart';
import '../widgets/ProfileTab.dart';
import '../widgets/RunningMusicTab.dart';

//HomeContentState _globalState = new HomeContentState();

var index = 0;

class HomeContent extends StatefulWidget {
  @override
  State createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
        body: new TabBarView(
          controller: _controller,
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
                  controller: _controller,
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
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    onChanged = () {
      setState(() {
        index = this._controller.index;
        print(_controller.index);
      });
    };
    _controller.addListener(onChanged);
    index = 0;
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
