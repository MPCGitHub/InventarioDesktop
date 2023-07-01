import 'package:flutter/material.dart';
import 'package:inventarius/models/celular.dart';
import 'package:inventarius/widgets/card_pesquisa.dart';
import 'package:inventarius/widgets/siderbar_custom.dart';

import '../../data/repository/mobile_manager.dart';

// ignore: must_be_immutable
class ConsultaCelulares extends StatelessWidget {
  List<Celular> listaCelulares = [];

  MobileManager mobileManager = MobileManager();
  ConsultaCelulares({super.key});

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
              'Consulta Celulares',
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
