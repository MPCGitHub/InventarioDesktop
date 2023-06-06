import 'package:flutter/material.dart';
import 'package:inventarius/Model/celular.dart';
import 'package:provider/provider.dart';
import 'database/celular.manager.dart';
import 'widgets/card_pesquisa.dart';
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu Principal',
        theme: ThemeData(
          brightness: Brightness.light, // Definindo o tema padrão como light
          // Restante das configurações do tema light
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
        title: const Text(
          'Menu Principal',
          style: TextStyle(
            color: Color.fromARGB(255, 17, 139, 117),
          ),
        ),
      ),
      body: Row(
        children: [
          const SidebarCustom(),
          Expanded(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Pesquisar',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchTerm = value;
                    });
                  },
                ),
                CustomCard(celularManager: celularManager)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
