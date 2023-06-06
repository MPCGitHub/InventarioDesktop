import 'package:flutter/material.dart';
import 'package:inventarius/pages/cadastro_monitor.dart';

import 'dropdown_custom.dart';

class SidebarCustom extends StatelessWidget {
  const SidebarCustom({super.key});

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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CadastroMonitor()),
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
                Card(
                  child: ListTile(
                    title: const Text('Celulares'),
                    onTap: () {
                      // Lógica para tratar o clique na opção 1
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Computadores'),
                    onTap: () {
                      // Lógica para tratar o clique na opção 2
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Monitores'),
                    onTap: () {
                      // Lógica para tratar o clique na opção 2
                    },
                  ),
                ),
                // Adicione mais ListTile para outras opções do dropdown
              ],
            ),

            // Adicione mais Card/ListTile para outras linhas da tabela
          ],
        ),
      ),
    );
  }
}
