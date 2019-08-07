import 'package:flutter/material.dart';
import 'package:sleep_app/sliver_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep App',
      theme: ThemeData(
        backgroundColor: Color(0xff121421),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontSize: 40),
          subtitle: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 16.5),
          display2: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
          display1: TextStyle(color: Colors.white, fontSize: 22),
        ),
        accentTextTheme: TextTheme(subtitle: TextStyle(color: Color(0xff3D5DA4), fontSize: 16.5)),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSearching = false;

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
                  if (!_isSearching)
                    Text(
                      'Discover',
                      style: Theme.of(context).primaryTextTheme.title,
                    ),
                  AnimatedContainer(
                    width: _isSearching ? 300 : 0,
                    duration: _isSearching ? Duration(milliseconds: 300) : Duration(seconds: 0),
                    curve: Curves.easeIn,
                    child: !_isSearching
                        ? null
                        : TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.blue.withOpacity(0.2),
                              filled: true,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 2,
                width: 35,
                color: Colors.blue,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 20),
              Expanded(child: GridList())
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff1C2031),
          unselectedItemColor: Color(0xff515A79),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.blur_circular),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
