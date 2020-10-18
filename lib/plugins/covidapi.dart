import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef void func();

var jsonResponse;

class CallAPI {
  static String url =
      'https://api.thevirustracker.com/free-api?countryTimeline=IN';

  static void getData(func f) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
      print("API SUCCESS!");
      f();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class MyApi extends StatefulWidget {
  @override
  _MyApiState createState() => _MyApiState();
}

class DataPoint {
  String date;
  int num;
  DataPoint(this.date, this.num);
}

class _MyApiState extends State<MyApi> {
  List<DataPoint> timeline = List<DataPoint>();

  void loadData() {
    setState(() {
      jsonResponse = jsonResponse['timelineitems'][0];
      // print(jsonResponse);

      jsonResponse.forEach((key, val) {
        if (key != 'stat') {
          //print(key);
          //print(val['total_cases']);
          timeline.add(DataPoint(key, val['total_cases']));
        }
      });

      print(timeline.length);
      print("\n\n");
      //print(timeline);
    });
  }

  @override
  void initState() {
    super.initState();
    CallAPI.getData(loadData);
  }

  @override
  Widget build(BuildContext context) {
    if (jsonResponse == null) {
      return Container(
        color: Colors.amber,
        child: Center(
          child: Text('Loading Data...'),
        ),
      );
    } else {
      return Container(
       // color: Colors.green,
        child: Column(
          children: <Widget>[
            Expanded(
                child: IconButton(
                    icon: Icon(
                      Icons.show_chart,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/graph',
                          arguments: timeline);
                    })),
            Container(
              height: 600,
              child: ShowListView(timeline)
              )
          ],
        ),
      );
    }
  }
}

class ShowListView extends StatelessWidget {
  final List<DataPoint> timeline;

  ShowListView(this.timeline);

  @override
  Widget build(BuildContext context) {
    print(timeline.length);
    print("\n\n");
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
        itemCount: timeline.length,
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
              leading: Text("${timeline[index].date}"),
              title: Center(child: Text("Total Cases: ${timeline[index].num}")),
            ),
          );
        });
  }
}
