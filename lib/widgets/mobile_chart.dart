import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MobileChart extends StatelessWidget {
  final List<ChartDataMobile> chartDataMobile;
  final double radiusHeight;

  const MobileChart(
      {Key? key, required this.chartDataMobile, required this.radiusHeight})
      : super(key: key);

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
        text: 'Marcas Celulares',
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontSize: 11,
          color: Color.fromARGB(255, 17, 139, 117),
          fontWeight: FontWeight.bold,
        ),
      ),
      series: <CircularSeries>[
        PieSeries<ChartDataMobile, String>(
            dataSource: chartDataMobile,
            xValueMapper: (ChartDataMobile series, _) => series.fabricante,
            yValueMapper: (ChartDataMobile series, _) => series.quantidade,
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
          (radiusHeight > 155 ? (radiusHeight / 2.45) : (radiusHeight / 2.75))
              .toString(),
    );
  }
}

class ChartDataMobile {
  final String fabricante;
  final int quantidade;

  ChartDataMobile({required this.fabricante, required this.quantidade});
}
