import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:cov2/screens/submenu/description.dart';
// ignore: must_be_immutable
class SettingsPage extends KFDrawerContent {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.height *0.55,
                      height: MediaQuery.of(context).size.width *0.2,
                        color: Color(0xffb0bec5),
                        child: Center(
                          child: Text(
                            'To know more about our product, tap here!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'B612'),
                          ),
                        )),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDespPage()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.height *0.55,
                      height: MediaQuery.of(context).size.width *0.2,
                      margin: EdgeInsets.all(5),
                      child:Material(
                        color: Color(0xffb0bec5),
                        child: Center(
                          child: Text(
                            'To buy our product, tap here!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'B612'),
                          ),
                        ))),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
