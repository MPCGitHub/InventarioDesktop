import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/monitor.dart';
import '../../widgets/monitor_chart.dart';
import '../../widgets/status_monitor_chart.dart';
import 'db_manager.dart';

class MonitorManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<ChartDataMonitor> chartDataMonitor = [];
  List<ChartStatusDataMonitor> chartStatusDataMonitor = [];
  List<Monitor> listaMonitores = [];

  MonitorManager() {
    databaseManager = DatabaseManager();
    carregarListaMonitor();
    getMonitorCount();
    getStatusMonitorCount();
  }

  Future<void> carregarListaMonitor() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results =
          await conn.query('SELECT * from dispositivos WHERE tipo = 3');
      for (var row in results) {
        final monitor = Monitor(
          idMonitor: row['id']?.toString() ?? '',
          manufacturer: row['manufacturer'] ?? '',
          modelo: row['modelo'] ?? '',
          serialNumber: row['serialNumber'] ?? '',
          departamento: row['departamento'] ?? '',
          empresa: row['empresa'] ?? '',
          site: row['site'] ?? '',
          statusDispositivo: row['status_dispositivo'] ?? '',
        );
        listaMonitores.add(monitor);
      }
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
      SELECT manufacturer AS manufacturer, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 3
      GROUP BY manufacturer
      ORDER BY Quantidade DESC;
    ''');
      for (var row in results) {
        chartDataMonitor.add(ChartDataMonitor(
            fabricante: row['manufacturer'] == 'Sem Informacao'
                ? 'S/Info'
                : row['manufacturer'],
            quantidade: (row['Quantidade']) as int));
      }
      notifyListeners();
      return chartDataMonitor;
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartStatusDataMonitor>> getStatusMonitorCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT status_dispositivo, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 3
      GROUP BY status_dispositivo;
    ''');
      for (var row in results) {
        chartStatusDataMonitor.add(ChartStatusDataMonitor(
            statusDispositivo: row['status_dispositivo'],
            quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartStatusDataMonitor;
    } finally {
      await databaseManager.disconnect();
    }
  }
}
