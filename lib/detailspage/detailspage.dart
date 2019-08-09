import 'package:flutter/material.dart';
import 'package:sleep_app/widgets.dart';

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
  Row makeIcons() {
    final List<Widget> icons = [];
    widget.icons.forEach((icon) {
      icons.add(
        Container(
          margin: EdgeInsets.only(top: 20, right: 18),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff2B2B36)),
          child: icon,
        ),
      );
    });
    return Row(
      children: icons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(children: <Widget>[
          Container(
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
                ImageSwiper(),
                makeIcons()
              ],
            ),
          ),
          Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff4A80F0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Start',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({Key key}) : super(key: key);

  final List<String> _imageURLs = const [
    'assets/images/mountain1.jpg',
    'assets/images/mountain2.jpg',
    'assets/images/mountain1.jpg',
    'assets/images/mountain2.jpg',
  ];

  List<Widget> makeImages() {
    final List<Widget> images = [];
    _imageURLs.forEach((image) {
      images.add(ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          height: 270,
          width: 270,
          fit: BoxFit.cover,
        ),
      ));
      images.add(SizedBox(
        width: 22,
      ));
    });

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ScrollConfiguration(
        behavior: NoOverscrollBehavior(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: makeImages(),
        ),
      ),
    );
  }
}
