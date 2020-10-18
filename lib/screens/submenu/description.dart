
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class MyDespPage extends StatefulWidget {
  MyDespPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDespPageState createState() => new _MyDespPageState();
}

class _MyDespPageState extends State<MyDespPage> {

  @override
  Widget build(BuildContext context) {
    return new Material(
    child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('data')
              ],
            )
            );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
