import 'package:flutter/material.dart';
import 'package:sleep_app/homepage/recents.dart';

import 'package:sleep_app/homepage/recommendeds.dart';
import 'package:sleep_app/widgets.dart';

import 'categories.dart';

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
        RecommendedSwitcher(showingAll: showingAll),
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
      ]),
    );
  }
}

class RecommendedSwitcher extends StatefulWidget {
  final bool showingAll;
  RecommendedSwitcher({Key key, @required this.showingAll}) : super(key: key);

  _RecommendedSwitcherState createState() => _RecommendedSwitcherState();
}

class _RecommendedSwitcherState extends State<RecommendedSwitcher> {
  List<Recommendeds> recommends = [
    Recommendeds(
      title: 'Sleep Meditation',
      description: '7 Day Audio Series',
      colors: [Color(0xff4635F8), Color(0xff4D77ED)],
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
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.showingAll) {
      return SliverGrid.count(
        childAspectRatio: 5 / 2.5,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        crossAxisCount: 1,
        children: recommends,
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        height: 185.0,
        child: ScrollConfiguration(
          behavior: NoOverscrollBehavior(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommends.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 15),
                child: Container(
                  width: 300,
                  child: recommends[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
