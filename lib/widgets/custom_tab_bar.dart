import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/desktop_manager.dart';
import 'package:inventarius/widgets/desktop_data_table.dart';
import 'package:inventarius/widgets/mobile_chart.dart';
import 'package:inventarius/widgets/monitor_data_table.dart';
import 'package:inventarius/widgets/status_desktop_chart.dart';
import 'package:inventarius/widgets/status_mobile_chart.dart';
import 'package:inventarius/widgets/status_monitor_chart.dart';
import 'package:provider/provider.dart';

import '../data/repository/mobile_manager.dart';
import '../data/repository/monitor_manager.dart';
import 'desktop_chart.dart';
import 'mobile_data_table.dart';
import 'monitor_chart.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                color: const Color.fromARGB(255, 43, 43, 43),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 17, 139, 117)
                                .withOpacity(0.5),
                            blurRadius: 2,
                            offset: const Offset(0, -4)),
                      ]),
                  tabs: const [
                    Tab(
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.phone_android, size: 28),
                          SizedBox(width: 15),
                          Text(
                            'Celulares',
                            style: TextStyle(
                                fontSize: 12), // Tamanho da fonte desejado
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.laptop_windows_sharp, size: 30),
                          SizedBox(width: 15),
                          Text(
                            'Desktop',
                            style: TextStyle(
                                fontSize: 12), // Tamanho da fonte desejado
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.desktop_windows_sharp, size: 28),
                          SizedBox(width: 15),
                          Text(
                            'Monitores',
                            style: TextStyle(
                                fontSize: 12), // Tamanho da fonte desejado
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Tab1(),
                  Tab2(),
                  Tab3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<MobileManager>(
                    builder: (context, mobileManager, _) {
                      final chartStatusDataMobile =
                          mobileManager.chartStatusDataMobile;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: StatusMobileChart(
                                chartStatusDataMobile: chartStatusDataMobile,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<MobileManager>(
                    builder: (context, mobileManager, _) {
                      final chartDataMobile = mobileManager.chartDataMobile;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: MobileChart(
                                chartDataMobile: chartDataMobile,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            shadowColor: Color.fromARGB(255, 17, 139, 117),
            child: MobileDataTable(),
          ),
        ),
      ],
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<DesktopManager>(
                    builder: (context, desktopManager, _) {
                      final chartStatusDataDesktop =
                          desktopManager.chartStatusDataDesktop;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: StatusDesktopChart(
                                chartStatusDataDesktop: chartStatusDataDesktop,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<DesktopManager>(
                    builder: (context, desktopManager, _) {
                      final chartDataDesktop = desktopManager.chartDataDesktop;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: DesktopChart(
                                chartDataDesktop: chartDataDesktop,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            shadowColor: Color.fromARGB(255, 17, 139, 117),
            child: DesktopDataTable(),
          ),
        ),
      ],
    );
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<MonitorManager>(
                    builder: (context, monitorManager, _) {
                      final chartStatusDataMonitor =
                          monitorManager.chartStatusDataMonitor;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: StatusMonitorChart(
                                chartStatusDataMonitor: chartStatusDataMonitor,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 2,
                  shadowColor: const Color.fromARGB(255, 17, 139, 117),
                  child: Consumer<MonitorManager>(
                    builder: (context, monitorManager, _) {
                      final chartDataMonitor = monitorManager.chartDataMonitor;
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Card(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: MonitorChart(
                                chartDataMonitor: chartDataMonitor,
                                radiusHeight: constraints.maxHeight,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            shadowColor: Color.fromARGB(255, 17, 139, 117),
            child: MonitorDataTable(),
          ),
        ),
      ],
    );
  }
}
