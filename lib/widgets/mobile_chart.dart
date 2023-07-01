import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MobileChart extends StatelessWidget {
  final List<ChartDataMobile> chartDataMobile;
  final double radiusHeight;

  const MobileChart({
    Key? key,
    required this.chartDataMobile,
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
        ColumnSeries<ChartDataMobile, String>(
          dataSource: chartDataMobile,
          xValueMapper: (ChartDataMobile series, _) => series.fabricante,
          yValueMapper: (ChartDataMobile series, _) => series.quantidade,
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
          width: 0.7,
        ),
      ],
      title: ChartTitle(
        text: 'Marcas Celulares',
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

class ChartDataMobile {
  final String fabricante;
  final int quantidade;

  ChartDataMobile({required this.fabricante, required this.quantidade});
}
