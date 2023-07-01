import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DesktopChart extends StatelessWidget {
  final List<ChartDataDesktop> chartDataDesktop;
  final double radiusHeight;

  const DesktopChart({
    Key? key,
    required this.chartDataDesktop,
    required this.radiusHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        rangePadding: ChartRangePadding.none,
        labelStyle: const TextStyle(
          fontSize: 7,
        ),
      ),
      primaryYAxis: NumericAxis(),
      series: <ChartSeries>[
        ColumnSeries<ChartDataDesktop, String>(
          dataSource: chartDataDesktop,
          xValueMapper: (ChartDataDesktop series, _) => series.fabricante,
          yValueMapper: (ChartDataDesktop series, _) => series.quantidade,
          dataLabelSettings: const DataLabelSettings(
            textStyle: TextStyle(
              fontSize: 12,
            ),
            isVisible: true,
          ),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 200, 83),
              Color.fromARGB(255, 18, 150, 125),
              Color.fromARGB(255, 0, 200, 83),
            ],
            stops: [0, 0.5, 0.9],
          ),
          width: 0.9,
        ),
      ],
      title: ChartTitle(
        text: 'Marcas Desktops',
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 17, 139, 117),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class ChartDataDesktop {
  final String fabricante;
  final int quantidade;

  ChartDataDesktop({required this.fabricante, required this.quantidade});
}
