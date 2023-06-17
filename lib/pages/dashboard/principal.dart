import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CombinedChartsPage extends StatelessWidget {
  final List<charts.Series<dynamic, String>> monitorSeriesList;
  final List<charts.Series<dynamic, String>> computerSeriesList;
  final List<charts.Series<dynamic, String>> mobileSeriesList;

  const CombinedChartsPage({
    super.key,
    required this.monitorSeriesList,
    required this.computerSeriesList,
    required this.mobileSeriesList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos Sofisticados'),
      ),
    );
  }
}

class Principal extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const Principal(this.seriesList, {super.key, required this.animate});

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
