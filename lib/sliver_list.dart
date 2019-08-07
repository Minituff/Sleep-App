import 'dart:math';

import 'package:flutter/material.dart';

// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter_sparkline/flutter_sparkline.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:animator/animator.dart';

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

        if (!showingAll)
          SliverGrid.count(
            childAspectRatio: 5 / 2.5,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            crossAxisCount: 1,
            children: <Widget>[
              Recommendeds(
                title: 'Sleep Meditation',
                description: '7 Day Audio Series',
                colors: [Color(0xff09C18A), Color(0xff12D99C)],
                icons: [Icon(Icons.headset), Icon(Icons.local_movies)],
              ),
              Recommendeds(
                title: 'Insomnia Podcast',
                description: 'How To Finally Get Some Sleep',
                colors: [Color(0xffFD81AA), Color(0xffF67D62)],
                icons: [Icon(Icons.local_movies)],
              ),
              Recommendeds(
                title: 'Lucid Dreaming Audiobook',
                description: 'Tips And Tricks For LD',
                colors: [Color(0xffF4BE25), Color(0xffFCCF3F)],
                icons: [Icon(Icons.child_care)],
              ),
              Recommendeds(
                title: 'Dream Journals',
                description: 'The secret to clearer sleep?',
                colors: [Color(0xff4635F8), Color(0xff4D77ED)],
                icons: [Icon(Icons.query_builder)],
              ),
            ],
          ),

        if (showingAll)
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
        Charts(),
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
  final List<Icon> icons;
  final String title;
  final String description;
  final List<Color> colors;
  const Recommendeds({Key key, this.title, this.description, this.icons, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: colors),
      ),
      child: Stack(children: <Widget>[
        Charts(),
        Charts(),
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Text(title, style: Theme.of(context).primaryTextTheme.display1),
                  ],
                ),
                SizedBox(height: 3),
                Text(description, style: Theme.of(context).primaryTextTheme.display2),
              ]),
              Container(
                width: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: icons,
                ),
              )
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
  List<FlSpot> data = [];
  List<int> upOrDown = [];

  @override
  void initState() {
    super.initState();
    for (double i = 1; i <= 7; i++) {
      data.add(FlSpot(i, Random().nextDouble() * 8));
      upOrDown.add(Random().nextInt(2));
    }
  }

  List<Color> colors = [Colors.white.withOpacity(0.2)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Animator(
          curve: Curves.ease,
          repeats: 0,
          tween: Tween<double>(begin: 0, end: 10),
          duration: const Duration(seconds: 7),
          builder: (anim) {
            if (anim.value.round() == 10.0) {
              upOrDown.clear();
              for (double i = 1; i <= 7; i++) {
                upOrDown.add(Random().nextInt(2));
              }
            }
            int index = -1;
            data = data.map((spot) {
              index++;
              if (upOrDown.elementAt(index) == 1) {
                return FlSpot(spot.x, spot.y + 0.025);
              } else {
                return FlSpot(spot.x, spot.y - 0.025);
              }
            }).toList();

            return FlChart(
              chart: LineChart(
                LineChartData(
                  lineTouchData: const LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      colors: colors,
                      spots: data,
                      curveSmoothness: 0.50,
                      isCurved: true,
                      barWidth: 0,
                      belowBarData: BelowBarData(show: true, colors: colors),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                  minY: 0,
                  titlesData: const FlTitlesData(
                    leftTitles: const SideTitles(
                      showTitles: false,
                    ),
                    bottomTitles: const SideTitles(
                      showTitles: false,
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: false,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
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
