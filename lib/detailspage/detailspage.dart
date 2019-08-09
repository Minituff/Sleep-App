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
  ScrollController _controller = ScrollController();
  double offset = 0;

  Row makeIcons() {
    final List<Widget> icons = [];
    widget.icons.forEach((icon) {
      icons.add(
        Container(
          margin: const EdgeInsets.only(top: 20, right: 18),
          padding: const EdgeInsets.all(15),
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
  void initState() {
    _controller.addListener(_onscroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onscroll);
    super.dispose();
  }

  void _onscroll() {
    setState(() {
      offset = _controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(children: <Widget>[
          Container(
            child: ScrollConfiguration(
              behavior: NoOverscrollBehavior(),
              child: CustomScrollView(
                controller: _controller,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    titleSpacing: 0.0,
                    elevation: 0.0,
                    centerTitle: true,
                    backgroundColor: Theme.of(context).backgroundColor,
                    expandedHeight: 100,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      opacity: offset >= 50 ? 1.0 : 0.0,
                      child: FittedBox(child: Text(widget.title, style: Theme.of(context).primaryTextTheme.title)),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                          padding: EdgeInsets.only(left: 25, right: 25, top: 50),
                          child: Text(widget.title, style: Theme.of(context).primaryTextTheme.title)),
                    ),
                    actions: <Widget>[
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
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 7),
                          Text(widget.subtitle, style: const TextStyle(color: Colors.grey, fontSize: 18)),
                          const SizedBox(height: 20),
                          ImageSwiper(),
                          makeIcons(),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 2,
                            width: 35,
                            color: Colors.blue,
                            alignment: Alignment.centerLeft,
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            children: <Widget>[
                              Text(
                                'Nisi ex eiusmod et id minim consectetur mollit cillum incididunt cupidatat cillum deserunt. Id dolor adipisicing sunt eiusmod aliquip. Anim deserunt cupidatat commodo deserunt magna exercitation labore do labore commodo cupidatat. Excepteur velit incididunt laborum pariatur aliqua cupidatat.Sit nulla ad eiusmod ex tempor fugiat laborum. Quis aliquip sint esse qui eiusmod sit cupidatat est adipisicing. Ipsum adipisicing ea qui dolore cillum mollit commodo aute fugiat elit velit qui amet. Ea incididunt officia laboris consequat cupidatat.',
                                style: TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                'Nisi ex eiusmod et id minim consectetur mollit cillum incididunt cupidatat cillum deserunt. Id dolor adipisicing sunt eiusmod aliquip. Anim deserunt cupidatat commodo deserunt magna exercitation labore do labore commodo cupidatat. Excepteur velit incididunt laborum pariatur aliqua cupidatat.Sit nulla ad eiusmod ex tempor fugiat laborum. Quis aliquip sint esse qui eiusmod sit cupidatat est adipisicing. Ipsum adipisicing ea qui dolore cillum mollit commodo aute fugiat elit velit qui amet. Ea incididunt officia laboris consequat cupidatat.',
                                style: TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                'Nisi ex eiusmod et id minim consectetur mollit cillum incididunt cupidatat cillum deserunt. Id dolor adipisicing sunt eiusmod aliquip. Anim deserunt cupidatat commodo deserunt magna exercitation labore do labore commodo cupidatat. Excepteur velit incididunt laborum pariatur aliqua cupidatat.Sit nulla ad eiusmod ex tempor fugiat laborum. Quis aliquip sint esse qui eiusmod sit cupidatat est adipisicing. Ipsum adipisicing ea qui dolore cillum mollit commodo aute fugiat elit velit qui amet. Ea incididunt officia laboris consequat cupidatat.',
                                style: TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 90),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
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
