import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStatusDataMobile {
  final String statusDispositivo;
  final int quantidade;

  ChartStatusDataMobile(
      {required this.statusDispositivo, required this.quantidade});
}

// ignore: must_be_immutable
class StatusMobileChart extends StatelessWidget {
  final List<ChartStatusDataMobile> chartStatusDataMobile;
  final double radiusHeight;

  StatusMobileChart(
      {super.key,
      required this.chartStatusDataMobile,
      required this.radiusHeight});

  List<Color> colorsGradiente = <Color>[
    const ui.Color.fromARGB(255, 62, 153, 228),
    const ui.Color.fromARGB(255, 62, 153, 228),
    const ui.Color.fromARGB(255, 34, 63, 116),
    const ui.Color.fromARGB(255, 47, 140, 184),
    const ui.Color.fromARGB(255, 24, 45, 83)
  ];
  List<Color> colors = <Color>[
    const ui.Color.fromARGB(255, 231, 167, 46),
    const ui.Color.fromARGB(255, 6, 229, 245),
    const ui.Color.fromARGB(255, 42, 170, 42),
  ];

  List<double> stops = <double>[
    0.2,
    0.4,
    0.6,
    0.8,
    1,
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      palette: colors,
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        return ui.Gradient.radial(
            chartShaderDetails.outerRect.center,
            chartShaderDetails.outerRect.right -
                chartShaderDetails.outerRect.center.dx,
            colorsGradiente,
            stops);
      },
      margin: const EdgeInsets.only(top: 10, right: 0),
      title: ChartTitle(
        text: 'Status Celulares',
        alignment: ChartAlignment.near,
        textStyle: const TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 17, 139, 117),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      series: <CircularSeries>[
        DoughnutSeries<ChartStatusDataMobile, String>(
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            margin: EdgeInsets.all(10),
          ),
          dataSource: chartStatusDataMobile,
          xValueMapper: (ChartStatusDataMobile series, _) =>
              series.statusDispositivo,
          yValueMapper: (ChartStatusDataMobile series, _) => series.quantidade,
          radius: (radiusHeight / 3).toString(),
          explode: true,
          explodeAll: true,
          explodeOffset: '3',
        ),
      ],
      centerY:
          (radiusHeight > 155 ? (radiusHeight / 2.55) : (radiusHeight / 2.65))
              .toString(),
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        textStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}
