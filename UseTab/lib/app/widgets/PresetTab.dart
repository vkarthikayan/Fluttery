import 'package:flutter/material.dart';
import 'package:jb/app/data/FetchData.dart';
import 'package:jb/app/data/Movies.dart';

class PresetTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new GradientAppBar(150.0, 0xFF3366FF, 0xFF00CCFF),
        new GradientAppBar(66.0, 0xFF00CCFF, 0xFF3366FF),
        new HomePageBody(),
      ],
    );
  }
}

class GradientAppBar extends StatelessWidget {
//  final String title;
  final double barHeight;
  final int startColor, endColor;

  GradientAppBar(this.barHeight, this.startColor, this.endColor);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [Color(startColor), Color(endColor)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = FetchData();
//    Future<List<Movies>> a = api.fetchPost();
    return new Expanded(
      child: FutureBuilder<List<Movies>>(
        future: api.fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Movies> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
