import 'package:flutter/material.dart';
import 'package:sleep_app/homepage/charts.dart';

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
                Wrap(children: <Widget>[
                  Text(title, style: Theme.of(context).primaryTextTheme.display1),
                ]),
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
        Container(
          child: Material(
            color: Colors.transparent,
            child: Container(
              child: InkWell(
                highlightColor: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
