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
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: MonitorChart(monitorSeriesList, animate: true),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: ComputerChart(computerSeriesList, animate: true),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: MobileChart(mobileSeriesList, animate: true),
            ),
          ),
        ],
      ),
    );
  }
}

class MonitorChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const MonitorChart(this.seriesList, {super.key, required this.animate});

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

class MobileChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const MobileChart(this.seriesList, {super.key, required this.animate});

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

  // @override
  //  Widget build (BuildContext context) {
  //   return MaterialApp(
  //     title: 'Combined Charts',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const CombinedChartsPage(
  //       monitorSeriesList: [
  //         // Defina suas séries de dados para o gráfico de monitor aqui
  //       ],
  //       computerSeriesList: [
  //         // Defina suas séries de dados para o gráfico de computador aqui
  //       ],
  //       mobileSeriesList: [
  //         // Defina suas séries de dados para o gráfico de celular aqui
  //       ],
  //     ),
  //   );
  // }
}
