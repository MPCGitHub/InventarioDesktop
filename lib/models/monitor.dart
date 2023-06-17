class Monitor {
  String idMonitor;
  String idDesktop;
  String monitorManufacturerPrimary;
  String monitorModelPrimary;
  String monitorSerialNumberPrimary;
  String monitorProviderPrimary;
  String monitorSerialProviderPrimary;
  String monitorManufacturerSecondary;
  String monitorModelSecondary;
  String monitorSerialNumberSecondary;
  String monitorProviderSecondary;
  String monitorSerialProviderSecondary;
  String department;
  String site;

  Monitor({
    required this.idMonitor,
    required this.idDesktop,
    required this.monitorManufacturerPrimary,
    required this.monitorModelPrimary,
    required this.monitorSerialNumberPrimary,
    required this.monitorProviderPrimary,
    required this.monitorSerialProviderPrimary,
    required this.monitorManufacturerSecondary,
    required this.monitorModelSecondary,
    required this.monitorSerialNumberSecondary,
    required this.monitorProviderSecondary,
    required this.monitorSerialProviderSecondary,
    required this.department,
    required this.site,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    return Monitor(
      idMonitor: json['id_monitor'],
      idDesktop: json['id_desktop'],
      monitorManufacturerPrimary: json['monitor_manufacturer_primary'],
      monitorModelPrimary: json['monitor_model_primary'],
      monitorSerialNumberPrimary: json['monitor_serial_number_primary'],
      monitorProviderPrimary: json['monitor_provider_primary'],
      monitorSerialProviderPrimary: json['monitor_serial_provider_primary'],
      monitorManufacturerSecondary: json['monitor_manufacturer_secondary'],
      monitorModelSecondary: json['monitor_model_secondary'],
      monitorSerialNumberSecondary: json['monitor_serial_number_secondary'],
      monitorProviderSecondary: json['monitor_provider_secondary'],
      monitorSerialProviderSecondary: json['monitor_serial_provider_secondary'],
      department: json['department'],
      site: json['site'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_monitor': idMonitor,
      'id_desktop': idDesktop,
      'monitor_manufacturer_primary': monitorManufacturerPrimary,
      'monitor_model_primary': monitorModelPrimary,
      'monitor_serial_number_primary': monitorSerialNumberPrimary,
      'monitor_provider_primary': monitorProviderPrimary,
      'monitor_serial_provider_primary': monitorSerialProviderPrimary,
      'monitor_manufacturer_secondary': monitorManufacturerSecondary,
      'monitor_model_secondary': monitorModelSecondary,
      'monitor_serial_number_secondary': monitorSerialNumberSecondary,
      'monitor_provider_secondary': monitorProviderSecondary,
      'monitor_serial_provider_secondary': monitorSerialProviderSecondary,
      'department': department,
      'site': site,
    };
  }

  @override
  String toString() {
    return 'Monitor{idMonitor: $idMonitor, idDesktop: $idDesktop, monitorManufacturerPrimary: $monitorManufacturerPrimary, '
        'monitorModelPrimary: $monitorModelPrimary, monitorSerialNumberPrimary: $monitorSerialNumberPrimary, '
        'monitorProviderPrimary: $monitorProviderPrimary, monitorSerialProviderPrimary: $monitorSerialProviderPrimary, '
        'monitorManufacturerSecondary: $monitorManufacturerSecondary, monitorModelSecondary: $monitorModelSecondary, '
        'monitorSerialNumberSecondary: $monitorSerialNumberSecondary, monitorProviderSecondary: $monitorProviderSecondary, '
        'monitorSerialProviderSecondary: $monitorSerialProviderSecondary, department: $department, site: $site}';
  }
}
