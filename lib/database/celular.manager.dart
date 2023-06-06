import 'package:flutter/material.dart';
import 'package:inventarius/Model/celular.dart';
import 'package:inventarius/database/db_manager.dart';
import 'package:mysql1/mysql1.dart';

class CelularManager extends ChangeNotifier {
  late DatabaseManager databaseManager;
  Future<MySqlConnection>? connection;
  List<Celular> allCelulares = [];

  CelularManager() {
    databaseManager = DatabaseManager();
    carregarListaCelular();
  }

  Future<void> carregarListaCelular() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    final results = await conn.query('SELECT * FROM celulares');
    final listaCelulares = <Celular>[];
    for (var row in results) {
      final celular = Celular(
        tag: row['tag'],
        fabricante: row['fabricante'],
        serialNumber: row['serial_number'],
        imei1: row['imei1'],
        imei2: row['imei2'],
        departamento: row['departamento'],
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
    await conn.close();
    allCelulares = listaCelulares;
    notifyListeners();
  }
}
