class Monitor {
  String idMonitor;
  String manufacturer;
  String modelo;
  String serialNumber;
  String departamento;
  String empresa;
  String site;
  String statusDispositivo;

  Monitor({
    required this.idMonitor,
    required this.manufacturer,
    required this.modelo,
    required this.serialNumber,
    required this.departamento,
    required this.empresa,
    required this.site,
    required this.statusDispositivo,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      idMonitor: json['id_monitor'],
      manufacturer: json['monitor_manufacturer_primary'],
      modelo: json['monitor_model_primary'],
      serialNumber: json['monitor_serial_number_primary'],
      departamento: json['department'],
      empresa: json['monitor_provider_primary'],
      site: json['site'],
      statusDispositivo: json['status_dispositivo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_monitor': idMonitor,
      'monitor_manufacturer_primary': manufacturer,
      'monitor_model_primary': modelo,
      'monitor_serial_number_primary': serialNumber,
      'department': departamento,
      'monitor_provider_primary': empresa,
      'site': site,
      'status_dispositivo': statusDispositivo,
    };
  }

  @override
  String toString() {
    return 'Monitor{idMonitor: $idMonitor, manufacturer: $manufacturer, modelo: $modelo, '
        'serialNumber: $serialNumber, departamento: $departamento, empresa: $empresa, '
        'site: $site, statusDispositivo: $statusDispositivo}';
  }
}
