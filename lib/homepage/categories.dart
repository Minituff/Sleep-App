import 'package:flutter/material.dart';
import 'package:sleep_app/widgets.dart';

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
