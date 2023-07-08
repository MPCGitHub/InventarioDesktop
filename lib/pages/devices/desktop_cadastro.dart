import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/desktop_manager.dart';

class DesktopCadastroPage extends StatefulWidget {
  const DesktopCadastroPage({super.key});

  @override
  State<DesktopCadastroPage> createState() => _DesktopCadastroPageState();
}

class _DesktopCadastroPageState extends State<DesktopCadastroPage> {
  Color? selectedTextColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Desktop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Consumer<DesktopManager>(
            builder: (context, desktopManager, _) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 124, 124, 124)
                          .withOpacity(0.6),
                      width: 0.2),
                ),
                margin: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Novo Dispositivo',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 32, 32, 32),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(1, 1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 124, 124, 124)
                                .withOpacity(0.6),
                            width: 0.2),
                      ),
                      margin: const EdgeInsets.all(10),
                      color: Colors.grey.shade700.withOpacity(0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 10,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'Tag',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'Nome Computador',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'Nome Usuário',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 7.5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value: desktopManager.manufacturerValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setManufacturerValue(newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.manufacturers
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.manufacturers
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value: desktopManager.modeloValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setModeloValue(newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.modelos
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.modelos
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.7,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Serial Number',
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value: desktopManager.departamentoValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setDepartamentoValue(newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.departamentos
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.departamentos
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.6,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'Sistema Operacional',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'HD',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.7,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                        labelText: 'Memória RAM',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value: desktopManager.empresaValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setEmpresaValue(newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.empresas
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.empresas
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.6,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Processador',
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Mac Address',
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.7,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value: desktopManager.siteValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setSiteValue(newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.sites
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.sites
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: const Color.fromARGB(
                                                  255, 124, 124, 124)
                                              .withOpacity(0.6),
                                          width: 0.2),
                                    ),
                                    elevation: 8,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 17, 139, 117),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Termo',
                                        contentPadding: EdgeInsets.only(
                                          left: 10,
                                          top: 8,
                                          bottom: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.6,
                                  child: Card(
                                    elevation: 8,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      isExpanded: true,
                                      value:
                                          desktopManager.statusDispositivoValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          desktopManager
                                              .setStatusDispositivoValue(
                                                  newValue!);
                                          selectedTextColor =
                                              const Color.fromARGB(
                                                  255, 245, 247, 246);
                                        });
                                      },
                                      style:
                                          TextStyle(color: selectedTextColor),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return desktopManager.statusDispositivos
                                            .map<Widget>((String value) {
                                          return Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 17, 139, 117),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: desktopManager.statusDispositivos
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            setState(() {
                                              selectedTextColor =
                                                  const Color.fromARGB(
                                                      255, 17, 139, 117);
                                            });
                                          },
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: selectedTextColor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica para salvar os dados do cadastro
                              },
                              child: const Text('Salvar'),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    // Outros campos do formulário aqui...
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
