import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cov2/plugins/covidapi.dart';


List<DataPoint> args;

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
  args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'CoronaVirus Tracker',
            ),
          ),
          backgroundColor: Colors.purple,
      ),
      body: MyChartBody(),
    );
  }
}

class MyChartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<DataPoint> args = ModalRoute.of(context).settings.arguments;
    
    var seriesList = [charts.Series<DataPoint, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_,ind) => ind,
        measureFn: (DataPoint dp, _) => dp.num,
        data: args)];
    return ExponentialCurve(seriesList);
  }
}


class ExponentialCurve extends StatefulWidget {
  final List<charts.Series<DataPoint, int>> lst;
  ExponentialCurve(this.lst);

  @override
  _ExponentialCurveState createState() => _ExponentialCurveState();
}

class _ExponentialCurveState extends State<ExponentialCurve> {

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(child: charts.LineChart(this.widget.lst, animate: true,));
  }
}