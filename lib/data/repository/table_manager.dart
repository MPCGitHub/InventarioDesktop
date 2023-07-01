import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import '../../models/device_data.dart';
import 'db_manager.dart';

class TableManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<DeviceData> mobileDataList = [];
  List<DeviceData> desktopDataList = [];
  List<DeviceData> monitorDataList = [];

  TableManager() {
    databaseManager = DatabaseManager();
    loadDataMobile();
    loadDataDesktop();
    loadDataMonitor();
  }

  Future<void> loadDataMobile() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('''
      SELECT
        SUM(CASE WHEN departamento = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN departamento = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN departamento = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN departamento = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN departamento = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN departamento = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN departamento = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN departamento = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN departamento = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN departamento = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN departamento = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM dispositivos
      WHERE tipo = 1;
    ''');
      for (var row in results) {
        DeviceData deviceData = DeviceData(
          dispositivos: row['Dispositivos'].toString(),
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
        mobileDataList.add(deviceData);
      }
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<void> loadDataDesktop() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('''
      SELECT
        SUM(CASE WHEN departamento = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN departamento = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN departamento = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN departamento = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN departamento = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN departamento = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN departamento = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN departamento = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN departamento = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN departamento = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN departamento = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM dispositivos
      WHERE tipo = 2;
    ''');
      for (var row in results) {
        DeviceData deviceData = DeviceData(
          dispositivos: row['Dispositivos'].toString(),
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
        desktopDataList.add(deviceData);
      }
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<void> loadDataMonitor() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('''
      SELECT
        SUM(CASE WHEN departamento = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
        SUM(CASE WHEN departamento = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
        SUM(CASE WHEN departamento = 'TI' THEN 1 ELSE 0 END) AS TI,
        SUM(CASE WHEN departamento = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
        SUM(CASE WHEN departamento = 'N/D' THEN 1 ELSE 0 END) AS ND,
        SUM(CASE WHEN departamento = 'RH' THEN 1 ELSE 0 END) AS RH,
        SUM(CASE WHEN departamento = 'BKO' THEN 1 ELSE 0 END) AS BKO,
        SUM(CASE WHEN departamento = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
        SUM(CASE WHEN departamento = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
        SUM(CASE WHEN departamento = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
        SUM(CASE WHEN departamento = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      FROM dispositivos
      WHERE tipo = 3;
    ''');
      for (var row in results) {
        DeviceData deviceData = DeviceData(
          dispositivos: row['Dispositivos'].toString(),
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
        monitorDataList.add(deviceData);
      }
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }
}

      // SELECT
      //   SUM(CASE WHEN departamento = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
      //   SUM(CASE WHEN departamento = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
      //   SUM(CASE WHEN departamento = 'TI' THEN 1 ELSE 0 END) AS TI,
      //   SUM(CASE WHEN departamento = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
      //   SUM(CASE WHEN departamento = 'N/D' THEN 1 ELSE 0 END) AS ND,
      //   SUM(CASE WHEN departamento = 'RH' THEN 1 ELSE 0 END) AS RH,
      //   SUM(CASE WHEN departamento = 'BKO' THEN 1 ELSE 0 END) AS BKO,
      //   SUM(CASE WHEN departamento = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
      //   SUM(CASE WHEN departamento = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
      //   SUM(CASE WHEN departamento = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
      //   SUM(CASE WHEN departamento = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      // FROM dispositivos
      // WHERE tipo = 1
      // UNION ALL
      // SELECT
      //   SUM(CASE WHEN departamento = 'Comercial' THEN 1 ELSE 0 END) AS Comercial,
      //   SUM(CASE WHEN departamento = 'Estoque' THEN 1 ELSE 0 END) AS Estoque,
      //   SUM(CASE WHEN departamento = 'TI' THEN 1 ELSE 0 END) AS TI,
      //   SUM(CASE WHEN departamento = 'Precatorio' THEN 1 ELSE 0 END) AS Precatorio,
      //   SUM(CASE WHEN departamento = 'N/D' THEN 1 ELSE 0 END) AS ND,
      //   SUM(CASE WHEN departamento = 'RH' THEN 1 ELSE 0 END) AS RH,
      //   SUM(CASE WHEN departamento = 'BKO' THEN 1 ELSE 0 END) AS BKO,
      //   SUM(CASE WHEN departamento = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
      //   SUM(CASE WHEN departamento = 'Diretoria' THEN 1 ELSE 0 END) AS Diretoria,
      //   SUM(CASE WHEN departamento = 'Financeiro' THEN 1 ELSE 0 END) AS Financeiro,
      //   SUM(CASE WHEN departamento = 'Steak Store' THEN 1 ELSE 0 END) AS SteakStore
      // FROM dispositivos
      // WHERE tipo = 2
      // UNION ALL