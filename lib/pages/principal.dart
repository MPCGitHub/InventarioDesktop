import 'package:flutter/material.dart';
import 'package:inventarius/pages/cadastro_desktop.dart';
import 'package:inventarius/pages/cadastro_monitor.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: const Text("INVENTÁRIO"),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            height: 35,
            color: Colors.grey.shade700.withOpacity(0.7),
            child: Row(
              children: [
                const SizedBox(width: 8),
                PopupMenuButton<int>(
                  onSelected: (newValue) {
                    if (newValue == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CadastroDesktop()),
                      );
                    }
                    if (newValue == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CadastroMonitor()));
                    }
                  },
                  color: Colors.grey.shade700.withOpacity(0.7),
                  tooltip: "Cadastro",
                  offset: const Offset(0, 28),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Desktop",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text(
                        "Monitor",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Impressora",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Celular",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Servidores",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Notebooks",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  child: const Text('Cadastro'),
                ),
                const SizedBox(width: 30),
                PopupMenuButton<int>(
                  color: Colors.grey.shade700.withOpacity(0.7),
                  tooltip: "Consulta",
                  offset: const Offset(0, 28),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 4,
                      child: Text(
                        "Usuário",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 5,
                      child: Text(
                        "Desktop",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 6,
                      child: Text(
                        "Monitor",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  child: const Text('Consulta'),
                ),
                const SizedBox(width: 30),
                PopupMenuButton<int>(
                  color: Colors.grey.shade700.withOpacity(0.7),
                  tooltip: "Relatórios",
                  offset: const Offset(0, 28),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 7,
                      child: Text(
                        "Usuários",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 8,
                      child: Text(
                        "Desktops",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 9,
                      child: Text(
                        "Monitores",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 10,
                      child: Text(
                        "Termos",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  child: const Text('Relatórios'),
                ),
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height * 0.91,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ImagemEstoque.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
