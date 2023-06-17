import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repository/celular_manager.dart';

class TabelaItens extends StatefulWidget {
  final CelularManager celularManager;
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
  final bool showDataColumn;

  const TabelaItens(
      {Key? key,
      required this.celularManager,
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
      required this.showDataColumn})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabelaItensState createState() => _TabelaItensState();
}

class _TabelaItensState extends State<TabelaItens> {
  @override
  void initState() {
    super.initState();
    widget.celularManager.addListener(_onCelularManagerChange);
  }

  @override
  void dispose() {
    widget.celularManager.removeListener(_onCelularManagerChange);
    super.dispose();
  }

  void _onCelularManagerChange() {
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
          child: Consumer<CelularManager>(
            builder: (_, celularManager, __) {
              return DataTable(
                columns: [
                  if (widget.showTagColumn)
                    const DataColumn(label: Text('Tag')),
                  if (widget.showFabricanteColumn)
                    const DataColumn(label: Text('Fabricante')),
                  if (widget.showSerialNumberColumn)
                    const DataColumn(label: Text('Serial Number')),
                  if (widget.showImei1Column)
                    const DataColumn(label: Text('IMEI 1')),
                  if (widget.showImei2Column)
                    const DataColumn(label: Text('IMEI 2')),
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
                  if (widget.showTermoColumn)
                    const DataColumn(label: Text('Termo')),
                  if (widget.showAtivoColumn)
                    const DataColumn(label: Text('Ativo')),
                  if (widget.showDataColumn)
                    const DataColumn(label: Text('Data')),
                ],
                rows: celularManager.allCelulares.map((celular) {
                  return DataRow(cells: [
                    if (widget.showTagColumn) DataCell(Text(celular.tag)),
                    if (widget.showFabricanteColumn)
                      DataCell(Text(celular.fabricante)),
                    if (widget.showSerialNumberColumn)
                      DataCell(Text(celular.serialNumber)),
                    if (widget.showImei1Column) DataCell(Text(celular.imei1)),
                    if (widget.showImei2Column) DataCell(Text(celular.imei2)),
                    if (widget.showDepartamentoColumn)
                      DataCell(Text(celular.departamento)),
                    if (widget.showModeloColumn) DataCell(Text(celular.modelo)),
                    if (widget.showHdColumn) DataCell(Text(celular.hd)),
                    if (widget.showColaboradorColumn)
                      DataCell(Text(celular.colaborador)),
                    if (widget.showEmpresaColumn)
                      DataCell(Text(celular.empresa)),
                    if (widget.showSiteColumn) DataCell(Text(celular.site)),
                    if (widget.showTermoColumn) DataCell(Text(celular.termo)),
                    if (widget.showAtivoColumn)
                      DataCell(Text(celular.ativo.toString())),
                    if (widget.showDataColumn) DataCell(Text(celular.data)),
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
