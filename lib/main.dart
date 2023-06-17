import 'package:flutter/material.dart';
import 'package:inventarius/models/celular.dart';
import 'package:inventarius/models/dashboard_data.dart';
import 'package:inventarius/widgets/frame_dashboard.dart';
import 'package:provider/provider.dart';
import 'data/repository/celular_manager.dart';
import 'data/repository/desktop_manager.dart';
import 'data/repository/monitor_manager.dart';
import 'data/repository/table_manager.dart';
import 'widgets/siderbar_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CelularManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardData(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => MonitorManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DesktopManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TableManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu Principal',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData.dark(), // Definindo o tema dark
        themeMode: ThemeMode.dark, // Definindo o modo do tema como dark
        home: const MenuPrincipal(),
      ),
    );
  }
}

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  List<Celular> listaCelulares = [];
  CelularManager celularManager = CelularManager();
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/MDG_logo_transparente.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            const Text(
              'Menu Principal',
              style: TextStyle(
                color: Color.fromARGB(255, 17, 139, 117),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: const Row(
        children: [
          SidebarCustom(),
          Expanded(
            child: FrameDashboard(),
          ),
        ],
      ),
    );
  }
}
