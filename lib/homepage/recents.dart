import 'package:flutter/material.dart';

import 'package:sleep_app/homepage/charts.dart';

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

