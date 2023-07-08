import 'package:flutter/material.dart';
import 'package:inventarius/pages/devices/cadastro_monitor.dart';
import 'package:inventarius/pages/devices/consulta_celulares.dart';

import '../pages/devices/desktop_cadastro.dart';
import 'dropdown_custom.dart';

class SidebarCustom extends StatefulWidget {
  const SidebarCustom({super.key});

  @override
  State<SidebarCustom> createState() => _SidebarCustomState();
}

class _SidebarCustomState extends State<SidebarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      color: const Color(0xFF202123),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                titleMedium: const TextStyle(color: Colors.white),
              ),
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Colors.white,
              ),
        ),
        child: ListView(
          children: [
            const Card(
              margin: EdgeInsets.all(2),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/AvatarDefault.png',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Nome do Usuário',
                            style: TextStyle(fontSize: 18.0)),
                        Text('Cargo',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomDropdown(
              title: 'Cadastro',
              items: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    // ou Column, dependendo do layout desejado
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 129, 128, 128),
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Celulares',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DesktopCadastroPage(),
                      ),
                    );
                  },
                  child: Row(
                    // ou Column, dependendo do layout desejado
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Computadores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Monitores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomDropdown(
              title: 'Consulta',
              items: [
                InkWell(
                  highlightColor:
                      const Color.fromARGB(255, 17, 139, 117).withOpacity(0.5),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConsultaCelulares(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Celulares',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Computadores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 16),
                                Text("Carregando..."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    Future.delayed(const Duration(microseconds: 10), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroMonitor(),
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Monitores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomDropdown(
              title: 'Movimentação',
              items: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 129, 128, 128),
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Celulares',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Computadores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Monitores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomDropdown(
              title: 'Exclusão',
              items: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    // ou Column, dependendo do layout desejado
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 129, 128, 128),
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Celulares',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    // ou Column, dependendo do layout desejado
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Computadores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          elevation: 5,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Monitores',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
