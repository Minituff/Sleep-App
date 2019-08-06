import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class GridList extends StatefulWidget {
  const GridList({Key key}) : super(key: key);

  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  bool showingAll = false;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoOverscrollBehavior(),
      child: CustomScrollView(slivers: <Widget>[
        Categories(),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 25, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Recommended', style: Theme.of(context).primaryTextTheme.subtitle),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showingAll = !showingAll;
                    });
                  },
                  child: Text(
                    !showingAll ? 'Show All' : 'Show Less',
                    style: Theme.of(context).accentTextTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        
        if (showingAll)
        SliverGrid.count(
          childAspectRatio: 5 / 2.5,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          crossAxisCount: 1,
          children: <Widget>[
            Recommendeds(
              title: 'Calming Sounds',
              colors: [Color(0xff09C18A), Color(0xff12D99C)],
              icon: Icon(Icons.headset),
            ),
            Recommendeds(
              title: 'Insomnia',
              colors: [Color(0xffFD81AA), Color(0xffF67D62)],
              icon: Icon(Icons.local_movies),
            ),
            Recommendeds(
              title: 'For Children',
              colors: [Color(0xffF4BE25), Color(0xffFCCF3F)],
              icon: Icon(Icons.child_care),
            ),
            Recommendeds(
              title: 'Tips for Sleeping',
              colors: [Color(0xff4635F8), Color(0xff4D77ED)],
              icon: Icon(Icons.query_builder),
            ),
          ],
        ),
        
        if(!showingAll)
        Categories(),
        
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 25, bottom: 0),
            child: Text('Recent', style: Theme.of(context).primaryTextTheme.subtitle),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverGrid.count(
          childAspectRatio: 5 / 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: <Widget>[
            Recents(
              title: 'Calming Sounds',
              colors: [Color(0xff09C18A), Color(0xff12D99C)],
              icon: Icon(Icons.headset),
            ),
            Recents(
              title: 'Insomnia',
              colors: [Color(0xffFD81AA), Color(0xffF67D62)],
              icon: Icon(Icons.local_movies),
            ),
            Recents(
              title: 'For Children',
              colors: [Color(0xffF4BE25), Color(0xffFCCF3F)],
              icon: Icon(Icons.child_care),
            ),
            Recents(
              title: 'Tips for Sleeping',
              colors: [Color(0xff4635F8), Color(0xff4D77ED)],
              icon: Icon(Icons.query_builder),
            ),
          ],
        )
        // SliverPadding(
        //   padding: EdgeInsets.all(16.0),
        //   sliver: SliverList(
        //     delegate: SliverChildListDelegate(
        //       [
        //         Card(child: Text('data')),
        //         Card(child: Text('data')),
        //         Card(child: Text('data')),
        //         Card(child: Text('data')),
        //       ],
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}

class Recents extends StatelessWidget {
  final Icon icon;
  final String title;
  final List<Color> colors;
  const Recents({Key key, this.title, this.icon, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: colors),
      ),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.red.withOpacity(0.5),
          ),
          child: Charts(),
        ),
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text(title, style: Theme.of(context).primaryTextTheme.display1),
                ],
              ),
              icon
            ],
          ),
        ),
      ]),
    );
  }
}


class Recommendeds extends StatelessWidget {
  final Icon icon;
  final String title;
  final List<Color> colors;
  const Recommendeds({Key key, this.title, this.icon, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: colors),
      ),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.red.withOpacity(0.5),
          ),
          child: Charts(),
        ),
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text(title, style: Theme.of(context).primaryTextTheme.display1),
                ],
              ),
              icon
            ],
          ),
        ),
      ]),
    );
  }
}

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selected = 0;
  List<String> categories = const [
    'Insomnia',
    'Depresssion',
    'Baby Sleep',
    'Sleep Stuff',
    'More Sleep',
    'Extra Sleep',
    'Lots of Sleep',
    'So Much Sleep'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 53.0,
        child: ScrollConfiguration(
          behavior: NoOverscrollBehavior(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  color: _selected == index ? Color(0xff4A80F0) : Color(0xff1C2031),
                ),
                margin: EdgeInsets.only(right: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: const Color(0x8034b0fc),
                    onTap: () {
                      setState(() {
                        _selected = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// * Prevent glow effect from overscrolling
class NoOverscrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
