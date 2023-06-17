import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonitorChart extends StatelessWidget {
  final List<ChartDataMonitor> chartDataMonitor;
  final double radiusHeight;

  const MonitorChart(
      {super.key, required this.chartDataMonitor, required this.radiusHeight});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(
        textStyle: const TextStyle(fontSize: 8),
        isVisible: true,
        position: LegendPosition.left,
      ),
      margin: const EdgeInsets.only(top: 0, right: 0),
      title: ChartTitle(
        text: 'Marcas Monitores',
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontSize: 11,
          color: Color.fromARGB(255, 17, 139, 117),
          fontWeight: FontWeight.bold,
        ),
      ),
      series: <CircularSeries>[
        PieSeries<ChartDataMonitor, String>(
            dataSource: chartDataMonitor,
            xValueMapper: (ChartDataMonitor series, _) => series.fabricante,
            yValueMapper: (ChartDataMonitor series, _) => series.quantidade,
            dataLabelSettings: const DataLabelSettings(
              textStyle: TextStyle(
                fontSize: 9,
              ),
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
            ),
            radius: (radiusHeight / 2.35).toString()),
      ],
      centerY:
          (radiusHeight > 155 ? (radiusHeight / 2.65) : (radiusHeight / 2.75))
              .toString(),
    );
  }
}

class ChartDataMonitor {
  final String fabricante;
  final int quantidade;

  ChartDataMonitor({required this.fabricante, required this.quantidade});
}
