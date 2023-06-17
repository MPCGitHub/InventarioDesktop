import 'package:mysql1/mysql1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DatabaseManager {
  MySqlConnection? _connection;

  Future<MySqlConnection> connect() async {
    await dotenv.load(fileName: ".env");
    final settings = ConnectionSettings(
        host: dotenv.env['DB_HOST'] as String,
        port: int.parse(dotenv.env['DB_PORT']!),
        user: dotenv.env['DB_USER'] as String,
        password: dotenv.env['DB_PASSWORD'] as String,
        db: dotenv.env['DB_DATABASE'] as String);
    final connection = await MySqlConnection.connect(settings);
    return connection;
  }

  Future<void> disconnect() async {
    if (_connection != null) {
      await _connection!.close();
    }
  }
}
