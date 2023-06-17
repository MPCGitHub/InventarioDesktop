import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/monitor.dart';
import '../../widgets/monitor_chart.dart';
import 'db_manager.dart';

class MonitorManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Monitor> allMonitores = [];
  List<ChartDataMonitor> chartDataMonitor = [];

  MonitorManager() {
    databaseManager = DatabaseManager();
    carregarListaMonitor();
    getMonitorCount();
  }

  Future<void> carregarListaMonitor() async {
    List<Monitor> listaMonitores = [];
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('SELECT * FROM monitores');
      for (var row in results) {
        final monitor = Monitor(
          idMonitor: row['id_monitor']?.toString() ?? '',
          idDesktop: row['id_desktop']?.toString() ?? '',
          monitorManufacturerPrimary: row['monitor_manufacturer_primary'] ?? '',
          monitorModelPrimary: row['monitor_model_primary'] ?? '',
          monitorSerialNumberPrimary:
              row['monitor_serial_number_primary'] ?? '',
          monitorProviderPrimary: row['monitor_provider_primary'] ?? '',
          monitorSerialProviderPrimary:
              row['monitor_serial_provider_primary'] ?? '',
          monitorManufacturerSecondary:
              row['monitor_manufacturer_secondary'] ?? '',
          monitorModelSecondary: row['monitor_model_secondary'] ?? '',
          monitorSerialNumberSecondary:
              row['monitor_serial_number_secondary'] ?? '',
          monitorProviderSecondary: row['monitor_provider_secondary'] ?? '',
          monitorSerialProviderSecondary:
              row['monitor_serial_provider_secondary'] ?? '',
          department: row['department'] ?? '',
          site: row['site'] ?? '',
        );
        listaMonitores.add(monitor);
      }
      allMonitores = listaMonitores;
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartDataMonitor>> getMonitorCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT 
        CASE 
          WHEN monitor_manufacturer_primary='' OR monitor_manufacturer_primary = 'Sem Informacao' THEN 'Sem Informacao'
          ELSE monitor_manufacturer_primary
        END AS Marca,
        COUNT(*) AS Quantidade
      FROM monitores
      GROUP BY Marca
      ORDER BY Quantidade DESC;
    ''');
      for (var row in results) {
        chartDataMonitor.add(ChartDataMonitor(
            fabricante: row['Marca'], quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartDataMonitor;
    } finally {
      await databaseManager.disconnect();
    }
  }
}
