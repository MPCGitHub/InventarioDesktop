import 'package:flutter/material.dart';
import 'package:inventarius/models/celular.dart';
import 'package:inventarius/data/repository/db_manager.dart';

import 'package:mysql1/mysql1.dart';

import '../../widgets/mobile_chart.dart';
import '../../widgets/status_mobile_chart.dart';

class MobileManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Celular> allMobiles = [];
  List<ChartDataMobile> chartDataMobile = [];
  List<ChartStatusDataMobile> chartStatusDataMobile = [];

  MobileManager() {
    databaseManager = DatabaseManager();
    loadListMobile();
    getMobileCount();
    getStatusMobileCount();
  }

  Future<void> loadListMobile() async {
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results =
          await conn.query('SELECT * from dispositivos WHERE tipo = 1');
      for (var row in results) {
        final celular = Celular(
            tag: row['tag'],
            fabricante: row['manufacturer'],
            serialNumber: row['serial_number'],
            imei1: row['imei1'],
            imei2: row['imei2'],
            departamento: row['departamento'],
            modelo: row['modelo'],
            hd: row['hd'],
            colaborador: row['user_name'],
            empresa: row['empresa'],
            site: row['site'],
            termo: row['termo'],
            status_dispositivo: row['status_dispositivo'],
            data: row['data'].toString());
        allMobiles.add(celular);
      }
      notifyListeners();
      await conn.close();
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartDataMobile>> getMobileCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT manufacturer AS Marca, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 1
      GROUP BY manufacturer
      ORDER BY Quantidade DESC;
    ''');
      for (var row in results) {
        chartDataMobile.add(ChartDataMobile(
            fabricante: row['Marca'], quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartDataMobile;
    } finally {
      await databaseManager.disconnect();
    }
  }

  Future<List<ChartStatusDataMobile>> getStatusMobileCount() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results results = await conn.query('''
      SELECT status_dispositivo, COUNT(*) AS Quantidade
      FROM dispositivos WHERE tipo = 1
      GROUP BY status_dispositivo;
    ''');
      for (var row in results) {
        chartStatusDataMobile.add(ChartStatusDataMobile(
            statusDispositivo: row['status_dispositivo'],
            quantidade: row['Quantidade']));
      }
      notifyListeners();
      return chartStatusDataMobile;
    } finally {
      await databaseManager.disconnect();
    }
  }
}
