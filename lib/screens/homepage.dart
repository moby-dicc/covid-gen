import 'package:flutter/material.dart';
import 'package:cov2/main.dart';

class LiteratureHomePage extends StatefulWidget {
  LiteratureHomePage({Key key, this.title}) : super(key: key);

  // Title of the application
  final String title;

  @override
  _LiteratureHomePage createState() => _LiteratureHomePage();
}

class _LiteratureHomePage extends State<LiteratureHomePage>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: 200,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                    color: Color(0xFFe1f5fe),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(color: Colors.amber),
                        Text(
                          'Literature',
                          style: TextStyle(
                              fontFamily: 'Monteserrat',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF37474f),
                              fontSize: 20.0),
                        ),
                        Text('Tap to Go!',
                            style: TextStyle(color: Color(0xFF37474f))),
                      ]),
                ),
                onTap: () {
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainWidget()),
                  );
                },
              ),
            ]),
      ),
    );
  }
}
