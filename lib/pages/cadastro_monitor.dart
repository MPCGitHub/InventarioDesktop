import 'package:flutter/material.dart';

import '../Model/celular.dart';
import '../database/celular.manager.dart';
import '../widgets/card_pesquisa.dart';
import '../widgets/siderbar_custom.dart';

class CadastroMonitor extends StatefulWidget {
  const CadastroMonitor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroMonitorState createState() => _CadastroMonitorState();
}

class _CadastroMonitorState extends State<CadastroMonitor> {
  List<Celular> listaCelulares = [];
  CelularManager celularManager = CelularManager();
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro Monitor',
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
