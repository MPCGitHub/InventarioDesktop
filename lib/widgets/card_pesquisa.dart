import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/mobile_manager.dart';
import 'package:inventarius/widgets/checkbox.dart';
import 'package:inventarius/widgets/tabela_mobile.dart';

class CustomCard extends StatefulWidget {
  final MobileManager mobileManager;

  const CustomCard({Key? key, required this.mobileManager}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool showTagColumn = true;
  bool showImei1Column = true;
  bool showModeloColumn = true;
  bool showColaboradorColumn = true;
  bool showTermoColumn = true;
  bool showFabricanteColumn = true;
  bool showImei2Column = true;
  bool showHdColumn = true;
  bool showEmpresaColumn = true;
  bool showAtivoColumn = true;
  bool showSerialNumberColumn = true;
  bool showDepartamentoColumn = true;
  bool showSiteColumn = true;
  bool showDataColumn = true;
  double aspectRatioFactor = 0.2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Card(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: GridView.count(
                childAspectRatio: 7,
                padding: const EdgeInsets.all(1),
                shrinkWrap: true,
                crossAxisCount: 5,
                mainAxisSpacing: 0.1,
                children: [
                  CustomCheckboxWithLabel(
                      label: 'Tag',
                      value: showTagColumn,
                      onChanged: (value) {
                        setState(() {
                          showTagColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'IMEI 1',
                      value: showImei1Column,
                      onChanged: (value) {
                        setState(() {
                          showImei1Column = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Modelo',
                      value: showModeloColumn,
                      onChanged: (value) {
                        setState(() {
                          showModeloColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Colaborador',
                      value: showColaboradorColumn,
                      onChanged: (value) {
                        setState(() {
                          showColaboradorColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Termo',
                      value: showTermoColumn,
                      onChanged: (value) {
                        setState(() {
                          showTermoColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Fabricante',
                      value: showFabricanteColumn,
                      onChanged: (value) {
                        setState(() {
                          showFabricanteColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'IMEI 2',
                      value: showImei2Column,
                      onChanged: (value) {
                        setState(() {
                          showImei2Column = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'HD',
                      value: showHdColumn,
                      onChanged: (value) {
                        setState(() {
                          showHdColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Empresa',
                      value: showEmpresaColumn,
                      onChanged: (value) {
                        setState(() {
                          showEmpresaColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Ativo',
                      value: showAtivoColumn,
                      onChanged: (value) {
                        setState(() {
                          showAtivoColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Serial Number',
                      value: showSerialNumberColumn,
                      onChanged: (value) {
                        setState(() {
                          showSerialNumberColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Departamento',
                      value: showDepartamentoColumn,
                      onChanged: (value) {
                        setState(() {
                          showDepartamentoColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Site',
                      value: showSiteColumn,
                      onChanged: (value) {
                        setState(() {
                          showSiteColumn = value!;
                        });
                      }),
                  CustomCheckboxWithLabel(
                      label: 'Data',
                      value: showDataColumn,
                      onChanged: (value) {
                        setState(() {
                          showDataColumn = value!;
                        });
                      }),
                ],
              ),
            ),
          ),
          TabelaMobile(
            mobileManager: widget.mobileManager,
            showTagColumn: showTagColumn,
            showImei1Column: showImei1Column,
            showModeloColumn: showModeloColumn,
            showColaboradorColumn: showColaboradorColumn,
            showTermoColumn: showTermoColumn,
            showFabricanteColumn: showFabricanteColumn,
            showImei2Column: showImei2Column,
            showHdColumn: showHdColumn,
            showEmpresaColumn: showEmpresaColumn,
            showAtivoColumn: showAtivoColumn,
            showSerialNumberColumn: showSerialNumberColumn,
            showDepartamentoColumn: showDepartamentoColumn,
            showSiteColumn: showSiteColumn,
            showDataColumn: showDataColumn,
          ),
        ],
      ),
    );
  }
}
