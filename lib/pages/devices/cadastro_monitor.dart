import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/mobile_manager.dart';

import '../../models/celular.dart';
import '../../widgets/card_pesquisa.dart';
import '../../widgets/siderbar_custom.dart';

// ignore: must_be_immutable
class CadastroMonitor extends StatelessWidget {
  List<Celular> listaCelulares = [];

  MobileManager mobileManager = MobileManager();

  CadastroMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const BackButtonIcon(),
            onPressed: () => Navigator.pop(context)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/MDG_logo_transparente.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 40,
            ),
            const Text(
              'Cadastro Monitor',
              style: TextStyle(
                color: Color.fromARGB(255, 17, 139, 117),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          const SidebarCustom(),
          Expanded(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                CustomCard(mobileManager: mobileManager)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
