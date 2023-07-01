import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/desktop.dart';
import '../../widgets/desktop_chart.dart';
import '../../widgets/status_desktop_chart.dart';
import 'db_manager.dart';

class DesktopManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Desktop> allDesktops = [];
  List<ChartDataDesktop> chartDataDesktop = [];
  List<ChartStatusDataDesktop> chartStatusDataDesktop = [];

  DesktopManager() {
    databaseManager = DatabaseManager();
    loadListDesktop();
    getDesktopCount();
    getStatusDesktopCount();
  }

  Future<void> loadListDesktop() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results =
          await conn.query('SELECT * from dispositivos WHERE tipo = 2');
      for (var row in results) {
        final desktop = Desktop(
          idDesktop: row['id_desktop']?.toString() ?? '',
          desktopTag: row['tag'],
          userName: row['user_name'],
          desktopComputerName: row['name'],
          desktopSerialNumber: row['serial_number'],
          desktopManufacturer: row['manufacturer'],
          desktopModel: row['modelo'],
          desktopTotalPhysicalMemory: row['total_physical_memory'],
          desktopOperatingSystem: row['operating_system'],
          desktopProvider: row['empresa'],
          desktopProcessor: row['processador'],
          desktopMacAddress: row['mac_address'],
          desktopDiskDrive: row['hd'],
          department: row['departamento'],
          site: row['site'],
          statusDispositivo: row['status_dispositivo'],
        );
        allDesktops.add(desktop);
      }
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartDataDesktop>> getDesktopCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT manufacturer AS manufacturer, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 2
      GROUP BY manufacturer
      ORDER BY Quantidade DESC;
    ''');
      for (var row in results) {
        chartDataDesktop.add(
          ChartDataDesktop(
            fabricante: row['manufacturer'],
            quantidade: row['Quantidade'],
          ),
        );
      }
      notifyListeners();
      return chartDataDesktop;
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartStatusDataDesktop>> getStatusDesktopCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT status_dispositivo, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 2
      GROUP BY status_dispositivo;
    ''');
      for (var row in results) {
        chartStatusDataDesktop.add(ChartStatusDataDesktop(
            statusDispositivo: row['status_dispositivo'],
            quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartStatusDataDesktop;
    } finally {
      await databaseManager.disconnect();
    }
  }
}
