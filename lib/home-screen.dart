import 'package:change4charity/MenuItem.dart';
import 'package:change4charity/exit_dialog.dart';
import 'package:change4charity/feedback-page.dart';
import 'package:change4charity/profile-page.dart';
import 'package:change4charity/report-page.dart';
import 'package:change4charity/share-page.dart';
import 'package:change4charity/states-page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:change4charity/dialog-helper.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final menus = [
    {'title': 'Feedback', 'icon': Icon(Icons.feedback), 'page': FeedbackPage()},
    {'title': 'Share', 'icon': Icon(Icons.share), 'page': SharePage()},
  ];
  final tabs = [
    Center(
      child: WebView(
        initialUrl: 'http://www.miteinanderfueruganda.de',
        javascriptMode: JavascriptMode.unrestricted,),),
    Report(),
    ExitDialog(),
    States(),
    ProfilePage()

  ];
  int _currentIndex = 0;
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {},
          ),
        ],
        title: Text("Charity4Change"),
      ),
      body: tabs[_currentTabIndex],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./assets/Images/logo.png"),
                  backgroundColor: Colors.redAccent,
                  radius: 60,
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.white, Colors.redAccent])),
            ),
            ...this.menus.map((item) {
              return new Column(
                children: <Widget>[
                  Divider(
                    color: Colors.red,
                  ),
                  MenuItem(item['title'], item['icon'], (context) {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => item['page']));
                  })
                ],
              );
            })
          ],
        ),
      ),
 /*     bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Reporting'),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_dissatisfied),
              title: Text('did it again'),
              backgroundColor: Colors.redAccent),

          BottomNavigationBarItem(
              icon: Icon(Icons.euro_symbol),
              title: Text('State'),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.redAccent)
        ],
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),*/
 /*     bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.redAccent,
        style: TabStyle.fixedCircle,

        items: [
          TabItem(icon: Icons.home, title: 'Home',),
          TabItem(icon: Icons.insert_chart, title: 'Reports'),
          TabItem(icon: Icons.sentiment_dissatisfied ,title: 'Ooops',),
          TabItem(icon: Icons.euro_symbol, title: 'State'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 2,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      FloatingActionButton(
        child: Icon(Icons.sentiment_dissatisfied,), onPressed: () {setState(() {
        _currentTabIndex = 2;
      });},backgroundColor: Colors.redAccent,),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 57,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              IconButton(icon: Icon(Icons.home),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    _currentTabIndex = 0;
                  });
                },
              ),

              IconButton(icon: Icon(Icons.insert_chart),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    _currentTabIndex = 1;
                  });
                },
              ),
              SizedBox(width: 40), // The dummy child

              IconButton(icon: Icon(Icons.euro_symbol),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    _currentTabIndex = 3;
                  });
                },
              ),

              IconButton(
                icon: Icon(Icons.person_outline),
                iconSize: 32,
                onPressed: () {
                  setState(() {
                    _currentTabIndex = 4;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
