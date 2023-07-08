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
  List<String> dropdownOptions = [];
  List<String> manufacturers = [];
  List<String> modelos = [];
  List<String> empresas = [];
  List<String> sites = [];
  List<String> departamentos = [];
  List<String> statusDispositivos = [];

  String selectedManufacturer = '';
  String selectedModelo = '';
  String selectedEmpresa = '';
  String selectedSite = '';
  String selectedDepartamento = '';
  String selectedStatusDispositivo = '';

  String get manufacturerValue =>
      manufacturers.isNotEmpty ? manufacturers[0] : '';
  String get modeloValue => modelos.isNotEmpty ? modelos[0] : '';
  String get empresaValue => empresas.isNotEmpty ? empresas[0] : '';
  String get siteValue => sites.isNotEmpty ? sites[0] : '';
  String get departamentoValue =>
      departamentos.isNotEmpty ? departamentos[0] : '';
  String get statusDispositivoValue =>
      statusDispositivos.isNotEmpty ? statusDispositivos[0] : '';

  DesktopManager() {
    databaseManager = DatabaseManager();
    loadListDesktop();
    getDesktopCount();
    getStatusDesktopCount();
    getListCadastroDesktop();
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

  Future<void> getListCadastroDesktop() async {
    connection = databaseManager.connect();
    final MySqlConnection conn = await connection!;
    try {
      Results manufacturersResult =
          await conn.query('SELECT DISTINCT manufacturer FROM dispositivos;');
      if (manufacturersResult.isNotEmpty) {
        List<String> manufacturersRow = manufacturersResult
            .map((row) => row['manufacturer']?.toString() ?? '')
            .toList();
        manufacturers = manufacturersRow
            .where((manufacturer) => manufacturer.isNotEmpty)
            .toSet()
            .toList();
      }

      Results modelosResult =
          await conn.query('SELECT DISTINCT modelo FROM dispositivos;');
      if (modelosResult.isNotEmpty) {
        List<String> modelosRow = modelosResult
            .map((row) => row['modelo']?.toString() ?? '')
            .toList();
        modelos =
            modelosRow.where((modelo) => modelo.isNotEmpty).toSet().toList();
      }

      Results empresasResult =
          await conn.query('SELECT DISTINCT empresa FROM dispositivos;');
      if (empresasResult.isNotEmpty) {
        List<String> empresasRow = empresasResult
            .map((row) => row['empresa']?.toString() ?? '')
            .toList();
        empresas =
            empresasRow.where((empresa) => empresa.isNotEmpty).toSet().toList();
      }

      Results sitesResult =
          await conn.query('SELECT DISTINCT site FROM dispositivos;');
      if (sitesResult.isNotEmpty) {
        List<String> sitesRow =
            sitesResult.map((row) => row['site']?.toString() ?? '').toList();
        sites = sitesRow.where((site) => site.isNotEmpty).toSet().toList();
      }

      Results departamentosResult =
          await conn.query('SELECT DISTINCT departamento FROM dispositivos;');
      if (departamentosResult.isNotEmpty) {
        List<String> departamentosRow = departamentosResult
            .map((row) => row['departamento']?.toString() ?? '')
            .toList();
        departamentos = departamentosRow
            .where((departamento) => departamento.isNotEmpty)
            .toSet()
            .toList();
      }

      Results statusDispositivosResult = await conn
          .query('SELECT DISTINCT status_dispositivo FROM dispositivos;');
      if (statusDispositivosResult.isNotEmpty) {
        List<String> statusDispositivosRow = statusDispositivosResult
            .map((row) => row['status_dispositivo']?.toString() ?? '')
            .toList();
        statusDispositivos = statusDispositivosRow
            .where((statusDispositivo) => statusDispositivo.isNotEmpty)
            .toSet()
            .toList();
      }
    } finally {
      await databaseManager.disconnect();
    }
    notifyListeners();
  }

  void setManufacturerValue(String value) {
    selectedManufacturer = value;
    notifyListeners();
  }

  void setModeloValue(String value) {
    selectedModelo = value;
    notifyListeners();
  }

  void setEmpresaValue(String value) {
    selectedEmpresa = value;
    notifyListeners();
  }

  void setSiteValue(String value) {
    selectedSite = value;
    notifyListeners();
  }

  void setDepartamentoValue(String value) {
    selectedDepartamento = value;
    notifyListeners();
  }

  void setStatusDispositivoValue(String value) {
    selectedStatusDispositivo = value;
    notifyListeners();
  }
}
