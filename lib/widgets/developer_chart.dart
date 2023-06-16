import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'developer_series.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  const DeveloperChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: const EdgeInsets.only(top: 20),
      title: ChartTitle(
        text: "Marcas",
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(fontSize: 10),
      ),
      series: <CircularSeries>[
        DoughnutSeries<DeveloperSeries, String>(
            dataSource: data,
            xValueMapper: (DeveloperSeries series, _) => series.year,
            yValueMapper: (DeveloperSeries series, _) => series.developers,
            pointColorMapper: (DeveloperSeries series, _) => series.barColor,
            innerRadius: '180%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
            ),
            startAngle: 270,
            endAngle: 90,
            explodeAll: true),
      ],
    );
  }
}
