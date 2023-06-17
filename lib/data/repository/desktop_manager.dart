import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/desktop.dart';
import '../../widgets/desktop_chart.dart';
import 'db_manager.dart';

class DesktopManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Desktop> allDesktops = [];
  List<ChartDataDesktop> chartDataDesktop = [];

  DesktopManager() {
    databaseManager = DatabaseManager();
    carregarListaDesktop();
    getDesktopCount();
  }

  Future<void> carregarListaDesktop() async {
    List<Desktop> listaDesktops = [];
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('SELECT * FROM desktops');
      for (var row in results) {
        final desktop = Desktop(
          idDesktop: row['id_desktop']?.toString() ?? '',
          desktopTag: row['desktop_tag'],
          userName: row['user_name'],
          desktopComputerName: row['desktop_computer_name'],
          desktopSerialNumber: row['desktop_serial_number'],
          desktopManufacturer: row['desktop_manufacturer'],
          desktopModel: row['desktop_model'],
          desktopTotalPhysicalMemory: row['desktop_total_physical_memory'],
          desktopOperatingSystem: row['desktop_operating_system'],
          desktopProvider: row['desktop_provider'],
          desktopProcessor: row['desktop_processor'],
          desktopMacAddress: row['desktop_mac_address'],
          desktopDiskDrive: row['desktop_disk_drive'],
          department: row['department'],
          site: row['site'],
          monitor1: row['monitor1']?.toString() ?? '',
          monitor2: row['monitor2']?.toString() ?? '',
        );
        listaDesktops.add(desktop);
      }
      allDesktops = listaDesktops;
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
      SELECT desktop_manufacturer AS Marca, COUNT(*) AS Quantidade
      FROM desktops
      GROUP BY desktop_manufacturer
      ORDER BY Quantidade DESC;
    ''');
      for (var row in results) {
        chartDataDesktop.add(ChartDataDesktop(
            fabricante: row['Marca'], quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartDataDesktop;
    } finally {
      await databaseManager.disconnect();
    }
  }
}
