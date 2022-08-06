// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'geolocator.dart';


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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Location {
  static double latitude = 0.0, longitude = 0.0;
}

// Home screen class
class _HomeScreenState extends State<HomeScreen> {

  var result = determinePosition().then((value) {
    print(Location.latitude);
    print(Location.longitude);
    Location.longitude = value.longitude;
    Location.latitude = value.latitude;
    print(Location.latitude);
    print(Location.longitude);
  });

  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          //label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          //label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          //label: 'Friends',
        ),
      ],
    ), tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Search the map'),
              centerTitle: true
              ),
              body: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                target: LatLng(Location.latitude, Location.longitude),
                zoom: 11.0),
                ),
          );
        } else if (index == 1) {
          return MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Image.asset('assets/tabs/image2.png'))
                      ]
                    ),
                    title: Text('Home'),
                    backgroundColor: Colors.red,
                )
              )
            )
          );
        } else {
          return MaterialApp(
            home: DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Image.asset('assets/tabs/image2.png'))
                    ]
                    ),
                    title: Text('Friends'),
                    backgroundColor: Colors.green,
                )
              )
            )
          );
        } 
      });
  }
}
