import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:cov2/plugins/covidapi.dart';

// ignore: must_be_immutable
class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(31.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height:60 ,
                //child: SingleChildScrollView(
                
                  child: MyApi(),
                
              //)
              ),
            ),
          
        
      
      ])));
      }
}
