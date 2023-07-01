import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/desktop_manager.dart';
import 'package:provider/provider.dart';

class TabelaDesktop extends StatefulWidget {
  final DesktopManager desktopManager;
  final bool showTagColumn;
  final bool showImei1Column;
  final bool showModeloColumn;
  final bool showColaboradorColumn;
  final bool showTermoColumn;
  final bool showFabricanteColumn;
  final bool showImei2Column;
  final bool showHdColumn;
  final bool showEmpresaColumn;
  final bool showAtivoColumn;
  final bool showSerialNumberColumn;
  final bool showDepartamentoColumn;
  final bool showSiteColumn;
  final bool showStatusColumn;

  const TabelaDesktop(
      {Key? key,
      required this.desktopManager,
      required this.showTagColumn,
      required this.showImei1Column,
      required this.showModeloColumn,
      required this.showColaboradorColumn,
      required this.showTermoColumn,
      required this.showFabricanteColumn,
      required this.showImei2Column,
      required this.showHdColumn,
      required this.showEmpresaColumn,
      required this.showAtivoColumn,
      required this.showSerialNumberColumn,
      required this.showDepartamentoColumn,
      required this.showSiteColumn,
      required this.showStatusColumn})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabelaItensState createState() => _TabelaItensState();
}

class _TabelaItensState extends State<TabelaDesktop> {
  @override
  void initState() {
    super.initState();
    widget.desktopManager.addListener(_ondesktopManagerChange);
  }

  @override
  void dispose() {
    widget.desktopManager.removeListener(_ondesktopManagerChange);
    super.dispose();
  }

  void _ondesktopManagerChange() {
    setState(() {
      // Chamar setState para atualizar a exibição quando ocorrerem alterações no celularManager
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<DesktopManager>(
            builder: (_, desktopManager, __) {
              return DataTable(
                columns: [
                  if (widget.showTagColumn)
                    const DataColumn(label: Text('Tag')),
                  if (widget.showFabricanteColumn)
                    const DataColumn(label: Text('Fabricante')),
                  if (widget.showSerialNumberColumn)
                    const DataColumn(label: Text('Serial Number')),
                  if (widget.showDepartamentoColumn)
                    const DataColumn(label: Text('Departamento')),
                  if (widget.showModeloColumn)
                    const DataColumn(label: Text('Modelo')),
                  if (widget.showHdColumn) const DataColumn(label: Text('HD')),
                  if (widget.showColaboradorColumn)
                    const DataColumn(label: Text('Colaborador')),
                  if (widget.showEmpresaColumn)
                    const DataColumn(label: Text('Empresa')),
                  if (widget.showSiteColumn)
                    const DataColumn(label: Text('Site')),
                  if (widget.showStatusColumn)
                    const DataColumn(label: Text('Status Dispositivo')),
                ],
                rows: desktopManager.allDesktops.map((desktop) {
                  return DataRow(cells: [
                    if (widget.showTagColumn)
                      DataCell(Text(desktop.desktopTag)),
                    if (widget.showFabricanteColumn)
                      DataCell(Text(desktop.desktopManufacturer)),
                    if (widget.showSerialNumberColumn)
                      DataCell(Text(desktop.desktopSerialNumber)),
                    if (widget.showDepartamentoColumn)
                      DataCell(Text(desktop.department)),
                    if (widget.showModeloColumn)
                      DataCell(Text(desktop.desktopModel)),
                    if (widget.showHdColumn)
                      DataCell(Text(desktop.desktopDiskDrive)),
                    if (widget.showColaboradorColumn)
                      DataCell(Text(desktop.userName)),
                    if (widget.showEmpresaColumn)
                      DataCell(Text(desktop.desktopProvider)),
                    if (widget.showSiteColumn) DataCell(Text(desktop.site)),
                    if (widget.showStatusColumn)
                      DataCell(Text(desktop.statusDispositivo)),
                  ]);
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
