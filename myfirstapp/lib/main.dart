// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CupertinoApp(
                      home: HomeScreen(),
                      localizationsDelegates: 
                      const <LocalizationsDelegate<dynamic>>[
                      DefaultMaterialLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate]));

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Tabs
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}

class MapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

// Home screen class
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*
    var questions = ["whats your favorite animal?",
                     "whats your favorite color?"];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App!"),
          ),
          body: Center(child: Column(
            children: [
              Text(questions[questionIndex]),
              ElevatedButton(child: Text("answer1"), onPressed: answerQuestion),
              ElevatedButton(child: Text("answer2"), onPressed: 
                             () => print("answer 2 chosen")),
              ElevatedButton(child: Text("answer3"), onPressed: answerQuestion)
            ],
          ))),
    );
  }
  */
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Friends',
        ),
      ],
    ), tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => HomeTab(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => MapTab(),
          );
        } else {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => FriendsTab(),
          );
        } 
      });
  }
}
