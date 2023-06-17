import 'package:flutter/material.dart';
import 'package:inventarius/models/celular.dart';
import 'package:inventarius/data/repository/db_manager.dart';
import 'package:inventarius/widgets/mobile_chart.dart';
import 'package:mysql1/mysql1.dart';

class CelularManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Celular> allCelulares = [];
  List<ChartDataMobile> chartDataMobile = [];

  CelularManager() {
    databaseManager = DatabaseManager();
    carregarListaCelular();
    getMobileCount();
  }

  Future<void> carregarListaCelular() async {
    List<Celular> listaCelulares = [];
    try {
      connection = databaseManager.connect();
      final MySqlConnection conn = await connection!;
      final results = await conn.query('SELECT * FROM celulares');
      for (var row in results) {
        final celular = Celular(
          tag: row['tag'],
          fabricante: row['fabricante'],
          serialNumber: row['serial_number'],
          imei1: row['imei1'],
          imei2: row['imei2'],
          departamento: row['department'],
          modelo: row['modelo'],
          hd: row['hd'],
          colaborador: row['colaborador'],
          empresa: row['empresa'],
          site: row['site'],
          termo: row['termo'],
          ativo: row['ativo'] == 1,
          data: row['data'],
        );
        listaCelulares.add(celular);
      }
      allCelulares = listaCelulares;
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
      SELECT fabricante AS Marca, COUNT(*) AS Quantidade
      FROM celulares
      GROUP BY fabricante
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
}
