import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ComputerChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const ComputerChart(this.seriesList, {super.key, required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),
    );
  }
}
