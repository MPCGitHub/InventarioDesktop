import 'package:flutter/material.dart';
import 'package:inventarius/widgets/drawer_card.dart';

class CadastroDesktop extends StatefulWidget {
  const CadastroDesktop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroDesktopState createState() => _CadastroDesktopState();
}

class _CadastroDesktopState extends State<CadastroDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        title: const Text("Cadastro Desktop"),
      ),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          color: Colors.grey.shade700.withOpacity(0.7),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Row(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: ListView(
                  children: <Widget>[
                    ExpansionTile(
                      childrenPadding: const EdgeInsets.all(0),
                      title: const Text(
                        "MARCAS",
                        textAlign: TextAlign.center,
                      ),
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 1,
                                texto: 'HP',
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 2,
                                texto: 'DELL',
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 2,
                                texto: 'LENOVO',
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 2,
                                texto: 'POSITIVO',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: const EdgeInsets.all(0),
                      title: const Text(
                        "MODELOS",
                        textAlign: TextAlign.center,
                      ),
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 1,
                                texto: 'DESKTOP 400G5 SFF',
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 2,
                                texto: 'DESKTOP 400G6 SFF',
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.20,
                              color: Colors.white,
                              child: const DrawerCard(
                                value: 2,
                                texto: 'MONTADA AUDITEM',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
