import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/device_data.dart';
import 'db_manager.dart';

class TableManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<DeviceData> deviceDataList = [];

  TableManager() {
    databaseManager = DatabaseManager();
    loadData();
  }

  Future<void> loadData() async {
    List<DeviceData> dataList = [];
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('''
      SELECT
        'Celulares' AS Dispositivos,
        SUM(CASE WHEN department = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN department = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN department = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN department = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN department = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN department = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN department = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN department = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN department = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN department = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN department = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM
        celulares
      UNION ALL
      SELECT
        'Monitores' AS Dispositivos,
        SUM(CASE WHEN department = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN department = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN department = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN department = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN department = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN department = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN department = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN department = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN department = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN department = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN department = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM
        monitores
      UNION ALL
      SELECT
        'Desktops' AS Dispositivos,
        SUM(CASE WHEN department = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN department = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN department = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN department = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN department = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN department = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN department = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN department = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN department = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN department = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN department = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM
        desktops;
    ''');
      for (var row in results) {
        DeviceData deviceData = DeviceData(
          dispositivos: row['Dispositivos'],
          comercial: (row['Comercial'] as double).toInt(),
          estoque: (row['Estoque'] as double).toInt(),
          ti: (row['TI'] as double).toInt(),
          precatorio: (row['Precatorio'] as double).toInt(),
          nd: (row['ND'] as double).toInt(),
          rh: (row['RH'] as double).toInt(),
          bko: (row['BKO'] as double).toInt(),
          marketing: (row['Marketing'] as double).toInt(),
          diretoria: (row['Diretoria'] as double).toInt(),
          financeiro: (row['Financeiro'] as double).toInt(),
          steakStore: (row['SteakStore'] as double).toInt(),
        );
        dataList.add(deviceData);
      }

      deviceDataList = dataList;
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }
}
