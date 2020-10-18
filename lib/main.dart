import 'package:flutter/material.dart';
import 'package:cov2/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'package:cov2/screens/submenu/authpage.dart';
import 'package:cov2/plugins/class-builder.dart';
import 'package:cov2/screens/submenu/localhosp.dart';
import 'package:cov2/screens/submenu/covidnews.dart';
import 'package:cov2/plugins/graph.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(),
        '/graph': (context) => GraphPage(),
      },
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();

    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 40, 5),
              padding: EdgeInsets.fromLTRB(0, 5, 40, 5),
              color: Colors.transparent,
              child: Text('COVID-19 News',
                  style: TextStyle(
                      fontFamily: 'B612',
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w200))),
          //icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 40, 5),
              padding: EdgeInsets.fromLTRB(0, 5, 40, 5),
              color: Colors.transparent,
              child: Text('Hospitals Near You',
                  style: TextStyle(
                      fontFamily: 'B612',
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w200))),
          //icon: Icon(Icons.calendar_today, color: Colors.white),
          page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 40, 5),
              padding: EdgeInsets.fromLTRB(0, 5, 40, 5),
              color: Colors.transparent,
              child: Text('Buy Our Product',
                  style: TextStyle(
                      fontFamily: 'B612',
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w200))),
          //icon: Icon(Icons.settings, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN IN',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'B612',
              fontSize: 22,
            ),
          ),
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return AuthPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff1b4d3e),
              Color(0xff00a86b),
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
