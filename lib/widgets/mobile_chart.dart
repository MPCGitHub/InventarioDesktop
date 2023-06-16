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
    debugPrint(radiusHeight.toString());
    return SfCircularChart(
      margin: const EdgeInsets.only(top: 0),
      title: ChartTitle(
        text: "Marcas Celulares",
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(fontSize: 10),
      ),
      series: <CircularSeries>[
        PieSeries<ChartDataMobile, String>(
            dataSource: chartDataMobile,
            xValueMapper: (ChartDataMobile series, _) => series.fabricante,
            yValueMapper: (ChartDataMobile series, _) => series.quantidade,
            dataLabelSettings: const DataLabelSettings(
              margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
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
