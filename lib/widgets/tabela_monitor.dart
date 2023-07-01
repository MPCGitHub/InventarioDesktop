import 'package:flutter/material.dart';
import 'package:inventarius/data/repository/desktop_manager.dart';
import 'package:inventarius/data/repository/monitor_manager.dart';
import 'package:provider/provider.dart';

class TabelaMonitor extends StatefulWidget {
  final MonitorManager monitorManager;
  final bool showIdColumn;
  final bool showFabricanteColumn;
  final bool showModeloColumn;
  final bool showSerialNumberColumn;
  final bool showDepartamentoColumn;
  final bool showEmpresaColumn;
  final bool showSiteColumn;
  final bool showStatusColumn;

  const TabelaMonitor(
      {Key? key,
      required this.monitorManager,
      required this.showIdColumn,
      required this.showFabricanteColumn,
      required this.showModeloColumn,
      required this.showSerialNumberColumn,
      required this.showDepartamentoColumn,
      required this.showEmpresaColumn,
      required this.showSiteColumn,
      required this.showStatusColumn})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabelaItensState createState() => _TabelaItensState();
}

class _TabelaItensState extends State<TabelaMonitor> {
  @override
  void initState() {
    super.initState();
    widget.monitorManager.addListener(_onMonitorManagerChange);
  }

  @override
  void dispose() {
    widget.monitorManager.removeListener(_onMonitorManagerChange);
    super.dispose();
  }

  void _onMonitorManagerChange() {
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
                  if (widget.showIdColumn) const DataColumn(label: Text('Id')),
                  if (widget.showFabricanteColumn)
                    const DataColumn(label: Text('Fabricante')),
                  if (widget.showModeloColumn)
                    const DataColumn(label: Text('Modelo')),
                  if (widget.showSerialNumberColumn)
                    const DataColumn(label: Text('Serial Number')),
                  if (widget.showDepartamentoColumn)
                    const DataColumn(label: Text('Departamento')),
                  if (widget.showEmpresaColumn)
                    const DataColumn(label: Text('Empresa')),
                  if (widget.showSiteColumn)
                    const DataColumn(label: Text('Site')),
                  if (widget.showStatusColumn)
                    const DataColumn(label: Text('Status Dispositivo')),
                ],
                rows: desktopManager.allDesktops.map((desktop) {
                  return DataRow(cells: [
                    if (widget.showIdColumn) DataCell(Text(desktop.desktopTag)),
                    if (widget.showFabricanteColumn)
                      DataCell(Text(desktop.desktopManufacturer)),
                    if (widget.showSerialNumberColumn)
                      DataCell(Text(desktop.desktopSerialNumber)),
                    if (widget.showDepartamentoColumn)
                      DataCell(Text(desktop.department)),
                    if (widget.showModeloColumn)
                      DataCell(Text(desktop.desktopModel)),
                    DataCell(Text(desktop.desktopDiskDrive)),
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
