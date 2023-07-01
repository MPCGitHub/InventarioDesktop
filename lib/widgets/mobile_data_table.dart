import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repository/table_manager.dart';
import '../models/device_data.dart';

class MobileDataTable extends StatelessWidget {
  const MobileDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TableManager>(
      builder: (context, tableManager, _) {
        List<DeviceData> deviceDataList = tableManager.mobileDataList;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Comercial')),
                      DataColumn(label: Text('Estoque')),
                      DataColumn(label: Text('TI')),
                      DataColumn(label: Text('Precatorio')),
                      DataColumn(label: Text('N/D')),
                      DataColumn(label: Text('RH')),
                      DataColumn(label: Text('BKO')),
                      DataColumn(label: Text('Marketing')),
                      DataColumn(label: Text('Diretoria')),
                      DataColumn(label: Text('Financeiro')),
                      DataColumn(label: Text('Steak Store')),
                    ],
                    rows: deviceDataList.map((deviceData) {
                      return DataRow(
                        cells: [
                          DataCell(Text(deviceData.comercial.toString())),
                          DataCell(Text(deviceData.estoque.toString())),
                          DataCell(Text(deviceData.ti.toString())),
                          DataCell(Text(deviceData.precatorio.toString())),
                          DataCell(Text(deviceData.nd.toString())),
                          DataCell(Text(deviceData.rh.toString())),
                          DataCell(Text(deviceData.bko.toString())),
                          DataCell(Text(deviceData.marketing.toString())),
                          DataCell(Text(deviceData.diretoria.toString())),
                          DataCell(Text(deviceData.financeiro.toString())),
                          DataCell(Text(deviceData.steakStore.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
