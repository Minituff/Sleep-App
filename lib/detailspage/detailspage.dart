import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Icon> icons;
  final String description;

  DetailsPage({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.icons,
    @required this.description,
  }) : super(key: key);

  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Theme.of(context).iconTheme.color,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(widget.title, style: Theme.of(context).primaryTextTheme.title),
              SizedBox(height: 7),
              Text(widget.subtitle, style: TextStyle(color: Colors.grey, fontSize: 18)),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/mountain1.jpg',
                  // height: 500,
                  // width: 300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
