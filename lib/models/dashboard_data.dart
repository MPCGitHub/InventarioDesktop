import 'package:flutter/foundation.dart';
import 'package:inventarius/data/repository/db_manager.dart';
import 'package:mysql1/mysql1.dart';
import '../widgets/mobile_chart.dart';

class DashboardData extends ChangeNotifier {
  late DatabaseManager _databaseManager;
  int _monitorCount = 0;

  int _desktopsCount = 0;

  DashboardData() {
    _databaseManager = DatabaseManager();
    _initializeMonitorCount();
    _initializeDesktopsCount();
  }

  int get monitorCount => _monitorCount;
  int get desktopsCount => _desktopsCount;
  List<ChartDataMobile> mobileCount = [];

  Future<void> _initializeMonitorCount() async {
    _monitorCount = await getMonitorCount();
    notifyListeners();
  }

  Future<void> _initializeDesktopsCount() async {
    _desktopsCount = await getDesktopsCount();
    notifyListeners();
  }

  Future<int> getMonitorCount() async {
    MySqlConnection connection = await _databaseManager.connect();

    try {
      Results results = await connection.query('''
        SELECT COUNT(*) AS Quantidade_Monitores
        FROM monitores
        ORDER BY Quantidade_Monitores DESC
      ''');

      for (var row in results) {
        int monitorCount = row['Quantidade_Monitores'];
        return monitorCount;
      }
      return 0;
    } finally {
      await _databaseManager.disconnect();
    }
  }

  Future<int> getDesktopsCount() async {
    MySqlConnection connection = await _databaseManager.connect();

    try {
      Results results = await connection.query('''
        SELECT COUNT(*) AS Quantidade_Desktops
        FROM desktops
        ORDER BY Quantidade_Desktops DESC;
      ''');

      for (var row in results) {
        int desktopsCount = row['Quantidade_Desktops'];
        return desktopsCount;
      }

      return 0;
    } finally {
      await _databaseManager.disconnect();
    }
  }
}
