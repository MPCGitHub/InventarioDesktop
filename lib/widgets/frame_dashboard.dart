import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/mobile_manager.dart';
import 'package:inventarius/widgets/mobile_chart.dart';
import 'package:provider/provider.dart';
import '../data/repository/desktop_manager.dart';
import '../data/repository/monitor_manager.dart';
import '../models/dashboard_data.dart';
import 'desktop_chart.dart';
import 'monitor_chart.dart';

class FrameDashboard extends StatefulWidget {
  const FrameDashboard({super.key});

  @override
  State<FrameDashboard> createState() => _FrameDashboardState();
}

class _FrameDashboardState extends State<FrameDashboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              'Status dos Dispositivos',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 37, 37, 37),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    offset: const Offset(1, 1),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 6,
                                  shadowColor: Colors.black,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade700
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '89',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '102',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '135',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Color(0xFF9B58B5),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.build,
                                                        color: Color.fromARGB(
                                                            255, 66, 65, 65)),
                                                    SizedBox(width: 10),
                                                    Text('Em Manutenção'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 6,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey.shade700.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '89',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '102',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '135',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xFF9B58B5),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: Color.fromARGB(
                                                    255, 17, 139, 117),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Em Uso'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 6,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey.shade700.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '89',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '102',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '135',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(0xFF9B58B5),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.storage),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Em Estoque'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Card(
                    elevation: 6,
                    shadowColor: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            "Quantidade de Dispositivos",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: const Offset(1, 1),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            elevation: 6,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Celulares',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.lightGreen
                                              .withOpacity(0.1),
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Consumer<DashboardData>(
                                    builder: (context, dashboardData, _) {
                                      return Row(
                                        children: [
                                          const VerticalDivider(
                                            color: Colors.white,
                                            thickness: 1.0,
                                            indent: 4.0,
                                            endIndent: 4.0,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '202',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.lightGreen
                                                      .withOpacity(0.1),
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            elevation: 6,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Computadores',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color:
                                              Colors.lightBlue.withOpacity(0.1),
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Consumer<DashboardData>(
                                    builder: (context, dashboardData, _) {
                                      return Row(
                                        children: [
                                          const VerticalDivider(
                                            color: Colors.white,
                                            thickness: 1.0,
                                            indent: 4.0,
                                            endIndent: 4.0,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            dashboardData.desktopsCount
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.lightGreen
                                                      .withOpacity(0.1),
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            elevation: 6,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Monitores',
                                    style: TextStyle(
                                      color: const Color(0xFF9B58B5),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.orangeAccent
                                              .withOpacity(0.1),
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Consumer<DashboardData>(
                                    builder: (context, dashboardData, _) {
                                      return Row(
                                        children: [
                                          const VerticalDivider(
                                            color: Colors.white,
                                            thickness: 1.0,
                                            indent: 4.0,
                                            endIndent: 4.0,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            dashboardData.monitorCount
                                                .toString(),
                                            style: TextStyle(
                                              color: const Color(0xFF9B58B5),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.lightGreen
                                                      .withOpacity(0.1),
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              elevation: 6,
              shadowColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Detalhes dos Dispositivos',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 37, 37, 37),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Consumer<MobileManager>(
                          builder: (context, celularManager, _) {
                            final chartDataMobile =
                                celularManager.chartDataMobile;
                            return Expanded(
                              flex: 1,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Card(
                                    color:
                                        Colors.grey.shade700.withOpacity(0.6),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: MobileChart(
                                        chartDataMobile: chartDataMobile,
                                        radiusHeight: constraints.maxHeight,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Consumer<DesktopManager>(
                          builder: (context, desktopManager, _) {
                            final chartDataDesktop =
                                desktopManager.chartDataDesktop;
                            return Expanded(
                              flex: 1,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Card(
                                    color:
                                        Colors.grey.shade700.withOpacity(0.6),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: DesktopChart(
                                        chartDataDesktop: chartDataDesktop,
                                        radiusHeight: constraints.maxHeight,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Consumer<MonitorManager>(
                          builder: (context, monitorManager, _) {
                            final chartDataMonitor =
                                monitorManager.chartDataMonitor;
                            return Expanded(
                              flex: 1,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Card(
                                    color:
                                        Colors.grey.shade700.withOpacity(0.6),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: MonitorChart(
                                        chartDataMonitor: chartDataMonitor,
                                        radiusHeight: constraints.maxHeight,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Card(
                elevation: 6,
                shadowColor: Colors.black,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'Distribuição dos Dispositivos por Setores',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 37, 37, 37),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: const Offset(1, 1),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Card(
                    //     color: Colors.grey.shade700.withOpacity(0.6),
                    //     child: const DeviceDataTable(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
